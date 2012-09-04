namespace :db do
  desc "Generate sample votes"
  task populate: :environment do

	  # determine the range of non-functional user ids
	  user_ids = User.all.map {|user| user.id }
	  user_nobody = User.find_by_email("nobody@nowhere.com").id
	  user_ids.delete(user_nobody)

	  # determine the range of book ids
	  book_ids = Book.all.map { |book| book.id }

		# find the number of non-functional users
		number_of_users = user_ids.count 

		# determine the number of votes per user
		votes_per_user = 3

		# determine the range of book ids available to vote for

		number_of_users.times do |user|
			votes_per_user.times do |vote|
				sample_book_id = book_ids.sample
				sample_user_id = user_ids.sample
				Vote.create!(book_id: sample_book_id, user_id: sample_user_id)
			end
		end  	
  end
end
