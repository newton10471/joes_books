class AllVotesController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@books = Book.all
  	@votes = Vote.all

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end
end
