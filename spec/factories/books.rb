FactoryGirl.define do
  sequence(:title) {|n| "Title#{n}"}
  sequence(:author) {|n| "Author#{n}"}
  factory :book do
    title
    author
  end
end
