FactoryBot.define do
  factory :application do
    sequence(:name){|n| "user#{n}" }
  end
end
