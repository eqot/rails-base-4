require "faker"

FactoryGirl.define do
  factory :user do
    provider { Faker::Company.name }
    uid { Faker::Number.number(8) }
    name { Faker::Name.name }
    image_url { Faker::Avatar.image }
  end
end
