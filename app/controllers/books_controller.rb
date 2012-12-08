class BooksController < ApplicationController
  before_filter :authenticate_user!
  require 'vacuum'
  require "rexml/document"
  include REXML

  # GET /books
  # GET /books.json
  def index
    @books = Book.find_all_by_user_id(current_user)

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  def get_book_asin(keywords)
    req = Vacuum.new
    req.configure key:    ENV['AWS_KEY'],
                  secret: ENV['AWS_SECRET'],
                  tag:    ENV['AWS_TAG']

    res = req.get query: { 'Operation'   => 'ItemSearch',
                           'SearchIndex' => 'Books',
                           'Keywords'    => keywords }

    doc = Document.new(res.body)
    detailPageURL = XPath.first(doc, "//DetailPageURL") 
    return /(.*ASIN%3D)(.*$)/.match(detailPageURL.text)[2]
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])
    @book.user_id = current_user.id
    @book.asin = get_book_asin(@book.title + " " + @book.author) 

    respond_to do |format|
      if @book.save
        format.html { redirect_to [current_user, @book], notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to [current_user, @book], notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to user_books_url }
      format.json { head :no_content }
    end
  end

end
