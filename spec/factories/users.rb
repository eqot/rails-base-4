require "faker"

FactoryGirl.define do
  factory :user do
    provider { Faker::Company.name }
    uid { Faker::Number.number(8) }
    name { Faker::Name.name }
    sequence(:image_url) { |n| "http://image.org/image#{n}.jpg" }
  end
end
