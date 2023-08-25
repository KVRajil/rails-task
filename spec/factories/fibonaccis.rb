FactoryBot.define do
  factory :fibonacci do
    value { 1 }
    result { 1 }
    runtime { 1.5 }
    created_at { Time.now }
  end
end
