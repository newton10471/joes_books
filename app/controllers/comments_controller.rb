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
    puts " ----- PARAMS IN CREATE: #{params}"

    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.book_id = params[:book_id]

    respond_to do |format|
      if @comment.save
        redirect_to @comment, notice: 'Comment was successfully created.' 
      else
        render action: "new"
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
end