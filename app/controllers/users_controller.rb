
class UsersController < ApplicationController
  def update
  	current_user.voted_book_ids = params[:user][:voted_book_ids]
  	current_user.save
  	
  	redirect_to new_user_vote_path(current_user)
  end
end
