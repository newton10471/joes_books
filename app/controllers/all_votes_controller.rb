class AllVotesController < ApplicationController
  before_filter :authenticate_user!

  def new
  	Vote.delete_all 
    ConfigParameter.find_by_name("second_round_started").update_attributes(value: "false")
  end

  def complete_round
    ConfigParameter.find_by_name("second_round_started").update_attributes(value: "true")
    
    # for bottom nth of voted-for books, set their vote count to 0

    # order the books by top votes last
    @books = Book.find(:all, :order => 'votes_count DESC')
    # get rid of books with zero votes
    @books = @books.select {|book| book.votes.count > 0}

    # remove the bottom n books
    num_books_to_remove = @books.count % 3 # n = 1/3
    count = 1
    @books.each do |book|
      if count < num_books_to_remove
        book.votes.delete_all
      end
      count += 1 
    end

    # remove all but the last vote on each remaining book
    Book.all.each do |book|
      if book.votes.count > 0 
        while book.votes.count > 1 
          book.votes.last.destroy
        end
        # set owner of the remaining vote to nobody
        book.votes.first.user_id = User.find_by_email('nobody@nowhere.com')
      end
    end
  end

  def index
  	@books = Book.find(:all, :order => 'votes_count DESC')
  	@votes = Vote.all

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end
end
