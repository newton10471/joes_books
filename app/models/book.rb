class Book < ActiveRecord::Base
  attr_accessible :amazon_link, :author, :title

  validates :author, :title, :presence => true
  validates_uniqueness_of :title, :case_sensitive => false

  belongs_to :user	
  has_many :votes
end
