class Comment < ActiveRecord::Base
  attr_accessible :book_id, :text, :user_id
  belongs_to :user
  belongs_to :book
end
