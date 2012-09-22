class User < ActiveRecord::Base
  before_create :set_user_blocked
  after_create :email_admin_and_user

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable #, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :voted_book_ids, :blocked

  validates :first_name, :last_name, :email, :password, :password_confirmation, :presence => true
  validates_uniqueness_of :email, :case_sensitive => false

  has_many :books
  has_many :votes
  has_many :voted_books, :through => :votes, :source => :book

  private
    def set_user_blocked
      self.blocked = true
    end

    def email_admin_and_user
      # call to ActionMailer to notify admin by email that there's a new user to unlock
      UserMailer.admin_notify_email(self).deliver
      # send welcome email to new user
      UserMailer.welcome_email(self).deliver
    end
end
