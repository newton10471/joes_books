class Book < ActiveRecord::Base
  attr_accessible :author, :title, :asin

  validates :author, :title, :presence => true
  validates_uniqueness_of :title, :case_sensitive => false

  belongs_to :user	
  has_many :votes
  has_many :comments
end
