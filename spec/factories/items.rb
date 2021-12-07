FactoryBot.define do
  factory :item do
    name { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    unit_price { Faker::Book.genre }
    merchant_id { Faker::Number.within(range: 1..10) }
  end
end

create_table "items", force: :cascade do |t|
  t.string "name"
  t.string "description"
  t.float "unit_price"
  t.bigint "merchant_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["merchant_id"], name: "index_items_on_merchant_id"
end
