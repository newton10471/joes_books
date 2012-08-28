class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :voted_book_ids

  validates :first_name, :last_name, :email, :password, :password_confirmation, :presence => true

  has_many :books
  has_many :votes
  has_many :voted_books, :through => :votes, :source => :book
end
