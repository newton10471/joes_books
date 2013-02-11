class VotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
    @vote.user_id = current_user.id

    # assign @books depending on state of election
    if (ConfigParameter.find_by_name("second_round_started").value == "false" )
      @books = Book.all
    else
      # if second round of voting has started, books are a subset of Book.all:
      # - don't include books that got no votes
      # - take at least half of the number of existing books as before
      @books = Book.all.select {|book| book.votes.count > 0}
    end
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def create
    @vote = Vote.new(params[:vote])

    if @vote.save
      # flash message below?
      flash[:notice] = "Vote was successfully cast!"
      redirect_to @vote, notice: 'Vote was successfully cast.'
    else
      render action: "new" 
    end
  end

  def update
    @vote = Vote.find(params[:id])

    if @vote.update_attributes(params[:vote])
      redirect_to @vote, notice: 'Vote was successfully updated.' 
    else
      render action: "edit"
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
  end
end
