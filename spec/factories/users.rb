FactoryGirl.define do
  sequence(:first_name) {|n| "first name#{n}"}
  sequence(:last_name) {|n| "last name#{n}"}
  sequence(:email) { |n| "email#{n}@example.com"}
  factory :user do
    first_name
    last_name
    email
    password %w(fsd87x fs837s s0ifss).sample
    password_confirmation { password}

  end
end
