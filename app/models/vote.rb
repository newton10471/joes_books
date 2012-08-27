class Vote < ActiveRecord::Base
  attr_accessible :book_id, :user_id

  validates :book_id, :user_id, :presence => true
  
  belongs_to :user
  belongs_to :book
end
