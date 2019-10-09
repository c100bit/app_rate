FactoryBot.define do
  factory :rate do
    sum { 1.5 }
    title { "usd" }
    sequence(:code, 'a') { |n| "us#{n}" }
    factory :rate_with_force do
      force_date { Time.current }
      force_sum { 10 }
    end
    factory :rate_with_histories do
      after :create do |rate|
        create_list :history, 3, rate: rate
      end
    end
  end
end
