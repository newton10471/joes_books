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
  factory :book do
    sequence(:title) { |n| "book#{n}" }
    author "Brad,Ediger"
    asin "978-7-121-11096-2"
    user

    factory :invalid_book do
      title nil
      author nil
      user nil
    end
  end
end
