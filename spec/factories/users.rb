FactoryGirl.define do
  sequence(:first_name) {|n| "Firstname#{n}"}
  sequence(:last_name) {|n| "Lastname#{n}"}
  sequence(:email) { |n| "email#{n}@example.com"}
  factory :user do
    first_name
    last_name
    email
    password %w(fsd87x fs837s s0ifss).sample
    password_confirmation { password}

  end
end
