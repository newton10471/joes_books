class AllVotesController < ApplicationController
  before_filter :authenticate_user!

  def new
  	Vote.delete_all 
  	VotesController.second_round_started = false
  end

  def complete_round
    VotesController.second_round_started = true
    # for bottom nth of voted-for books, set their vote count to 0
    books = Book.all.select {|book| book.votes.count > 0}
    books_to_keep = books.select {|book| book_votes_count > 0}
    # set current vote count for each voted-on book to 1
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
