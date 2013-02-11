class AllBooksController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
end
