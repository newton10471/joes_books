FactoryGirl.define do
  sample_login = ['jack', 'lucy', 'dave', 'lily', 'john', 'beth'].sample
  sequence(:first_name) { |n| "#{sample_loghn}#{n}" }
  sequence(:last_name) { |n| "#{sample_login}#{n}" }
  sequence(:email) { |n| "#{sample_login}#{n}@example.com".downcase }

  factory :user do
    first_name
    last_name
    email
    password ['DJX5nvyX', 'GG83Sr4{', '_pW.2P*8', 'MH^IN3B_'].sample
    password_confirmation { password }

    # create role user for all roles
    #   
    # trait :admin do
    #   roles ["admin"]
    # end
    #   
  end
end
