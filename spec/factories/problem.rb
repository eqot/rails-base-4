require "faker"

FactoryGirl.define do
  factory :problem do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    association :owner_id, factory: :user
  end
end
