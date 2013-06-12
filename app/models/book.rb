# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  author      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  votes_count :integer          default(0), not null
#  asin        :string(255)
#

class Book < ActiveRecord::Base
  attr_accessible :author, :title, :asin

  validates :author, :title, :presence => true
  validates_uniqueness_of :title, :case_sensitive => false

  belongs_to :user	
  has_many :votes
end
