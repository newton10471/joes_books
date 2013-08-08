# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  admin                  :boolean          default(FALSE)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  blocked                :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # before_create :set_user_blocked
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
  has_many :comments

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
