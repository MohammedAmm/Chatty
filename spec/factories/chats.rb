FactoryBot.define do
    factory :chat do
      sequence(:title){|n| "user#{n}" }
      sequence(:number){|n| n }

    end
  end
  