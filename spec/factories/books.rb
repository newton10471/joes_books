# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  author      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  votes_count :integer          default(0), not null
#  asin        :string(255)
#

FactoryGirl.define do
  sequence(:title) {|n| "Title#{n}"}
  sequence(:author) {|n| "Author#{n}"}
  factory :book do
    title
    author
  end

  factory :invalid_book do
    title nil
    author nil
    user nil
  end
end
