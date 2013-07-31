FactoryGirl.define do
  sequence(:text) {|n| "Blah blah blah #{n}"}
  factory :comment do
    text
  end
end
