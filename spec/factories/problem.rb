require "faker"

FactoryGirl.define do
  factory :problem do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    association :owner_id, factory: :user

    after(:build) do |problem|
      problem.owner_id ||= create(:user).id
    end

    factory :invalid_problem do
      after(:build) do |problem|
        problem.owner_id = nil
      end
    end
  end
end
