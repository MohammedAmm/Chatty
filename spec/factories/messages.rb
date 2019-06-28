FactoryBot.define do
    factory :message do
      sequence(:body){|n| "user#{n}" }
      sequence(:number){|n| n }
    end
  end
  