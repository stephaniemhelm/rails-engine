FactoryBot.define do
  factory :item do
    name { Faker::FunnyName.name }
    description { Faker::Lorem.paragraph }
    unit_price { Faker::Number.within(range: 20..1000) }
  end
end
