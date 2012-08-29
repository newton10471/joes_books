class Book < ActiveRecord::Base
  attr_accessible :amazon_link, :author, :title

  validates :author, :title, :presence => true
  validates :title, :uniqueness => true

  belongs_to :user	
  has_many :votes
end
