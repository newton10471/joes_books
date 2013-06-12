# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  attr_accessible :book_id, :user_id

  validates :book_id, :user_id, :presence => true
  
  belongs_to :user
  belongs_to :book, :counter_cache => true
end
