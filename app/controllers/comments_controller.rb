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
        format.html { render partial: 'shared/comments', locals: {comment: @comment} }
        #format.html { redirect_to user_book_path(current_user, Book.find(@comment.book_id)), notice: 'Comment was successfully created.' }
      else
        render action: "new"
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    Comment.find(params[:id]).destroy
    render text: 'ok'
  end
end
