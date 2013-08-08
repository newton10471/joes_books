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

#FactoryGirl.define do
#  sample_login = ['jack', 'lucy', 'dave', 'lily', 'john', 'beth'].sample
#  sequence(:first_name) { |n| "#{sample_login}#{n}" }
#  sequence(:last_name) { |n| "#{sample_login}#{n}" }
#  sequence(:email) { |n| "#{sample_login}#{n}@example.com".downcase }

FactoryGirl.define do
  sequence(:first_name) {|n| "Firstname#{n}"}
  sequence(:last_name) {|n| "Lastname#{n}"}
  sequence(:email) { |n| "email#{n}@example.com"}
  factory :user do
    first_name
    last_name
    email

    # create role user for all roles
    #   
    # trait :admin do
    #   roles ["admin"]
    # end
    #   

    password %w(fsd87x fs837s s0ifss).sample
    password_confirmation { password }
  end
end
