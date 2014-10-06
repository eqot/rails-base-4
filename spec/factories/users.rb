FactoryGirl.define do
  factory :user do
    provider "Provider"
    uid "Uid"
    name "Name"
    sequence(:image_url) { |n| "http://image.org/image#{n}.jpg" }
  end
end
