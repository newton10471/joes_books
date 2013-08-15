class BooksController < ApplicationController
  require 'vacuum'
  require "rexml/document"
  # include REXML

  before_filter :authenticate_user!

  def index
    @books = Book.where(user_id: current_user)
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments
    @comment = Comment.new(:book_id => params[:id])
    # @comment = Comment.new(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])
    @book.user_id = current_user.id
    if @book.asin.blank?  # if current_user didn't enter an ASIN, then look it up
      @book.asin = get_book_asin(@book.title + " " + @book.author) 
    end

    if @book.save
      redirect_to [current_user, @book], notice: 'Book was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to [current_user, @book], notice: 'Book was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to user_books_url 
  end

  def get_book_asin(keywords)
    req = Vacuum.new
    req.configure key:    ENV['AWS_KEY'],
                  secret: ENV['AWS_SECRET'],
                  tag:    ENV['AWS_TAG']

    res = req.get query: { 'Operation'   => 'ItemSearch',
                           'SearchIndex' => 'Books',
                           'Keywords'    => keywords }

    # do this to avoid using 'include REXML' above and running into Comment class name clash documented in 
    # https://groups.google.com/forum/?hl=en&fromgroups=#!topic/rubyonrails-talk/7RcK66ML_Xo
    doc = REXML::Document.new(res.body)
    detailPageURL = XPath.first(doc, "//DetailPageURL") 
    return /(.*ASIN%3D)(.*$)/.match(detailPageURL.text)[2]
  end
end
