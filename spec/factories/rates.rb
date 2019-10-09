FactoryBot.define do
  factory :rate do
    sum { 1.5 }
    title { "usd" }
    code { "usd" }
    factory :rate_with_force do
      force_date { Time.current }
      force_sum { 10 }
    end

  end
end
