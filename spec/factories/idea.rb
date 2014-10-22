require "faker"

FactoryGirl.define do
  factory :idea do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    association :owner_id, factory: :user

    after(:build) do |idea|
      idea.owner_id ||= create(:user).id
    end

    factory :invalid_idea do
      after(:build) do |idea|
        idea.owner_id = nil
      end
    end
  end
end
