require 'rails_helper'

describe "Items Search API" do
  it 'can find one item by name search' do
    merchant = create(:merchant)
    item1 = create(:item, name: 'Sand', merchant_id: merchant.id)
    item2 = create(:item, name: 'Seashells and Sand', merchant_id: merchant.id)
    item3 = create(:item, name: 'Sandy Picture', merchant_id: merchant.id)
    item4 = create(:item, name: 'Farm Picture', merchant_id: merchant.id)
    name = 'sand'
    get "/api/v1/items/find?name=#{name}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    item = parsed[:data]

    expect(response).to be_successful

    expect(item[:attributes][:name]).to eq(item1.name)
  end

  it 'can find all items by name search' do
    merchant = create(:merchant)
    item1 = create(:item, name: 'Sand', merchant_id: merchant.id)
    item2 = create(:item, name: 'Seashells and Sand', merchant_id: merchant.id)
    item3 = create(:item, name: 'Sandy Picture', merchant_id: merchant.id)
    item4 = create(:item, name: 'Farm Picture', merchant_id: merchant.id)
    name = 'sand'
    get "/api/v1/items/find_all?name=#{name}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    items = parsed[:data]

    expect(response).to be_successful

    results = items.map do |item|
      item[:attributes][:name]
    end
    expect(results).to eq([item1.name, item2.name, item3.name])
  end
end
