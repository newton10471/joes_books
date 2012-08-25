class AllBooksController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@books = Book.all

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end
end
