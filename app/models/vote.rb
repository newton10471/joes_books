class Vote < ActiveRecord::Base
  attr_accessible :book_id, :user_id

  belongs_to :user
  has_one :book
end
