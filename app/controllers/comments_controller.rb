class CommentsController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_book_path(current_user, Book.find(@comment.book_id)), notice: 'Comment was successfully created.' }
      else
        render action: "new"
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
end
