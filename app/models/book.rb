class Book < ActiveRecord::Base
  attr_accessible :amazon_link, :author, :title

  belongs_to :user
end
