class AllVotesController < ApplicationController
  before_filter :authenticate_user!

  def new
  	Vote.delete_all 
  	VotesController.second_round_started = false
  end

  def complete_round
    VotesController.second_round_started = true
  end

  def index
  	@books = Book.all
  	@votes = Vote.all

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end
end
