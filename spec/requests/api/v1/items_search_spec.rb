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

  it 'can find all items by minimum price search' do
    merchant = create(:merchant)
    item1 = create(:item, unit_price: 100.99, merchant_id: merchant.id)
    item2 = create(:item, unit_price: 150.99, merchant_id: merchant.id)
    item3 = create(:item, unit_price: 211.00, merchant_id: merchant.id)
    item4 = create(:item, unit_price: 130.55, merchant_id: merchant.id)
    price = 150.00

    get "/api/v1/items/find?min_price=#{price}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    items = parsed[:data]
    #require "pry"; binding.pry
    expect(response).to be_successful

    results = items.map do |item|
      item[:attributes][:unit_price]
    end
    expect(results).to eq([item2.unit_price,item3.unit_price])
  end

  it 'can find all items by maximum price search' do
    merchant = create(:merchant)
    item1 = create(:item, unit_price: 100.99, merchant_id: merchant.id)
    item2 = create(:item, unit_price: 150.99, merchant_id: merchant.id)
    item3 = create(:item, unit_price: 211.00, merchant_id: merchant.id)
    item4 = create(:item, unit_price: 130.55, merchant_id: merchant.id)
    price = 150.00

    get "/api/v1/items/find?max_price=#{price}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    items = parsed[:data]
    expect(response).to be_successful

    results = items.map do |item|
      #require "pry"; binding.pry
      item[:attributes][:unit_price]
    end
    expect(results).to eq([item1.unit_price, item4.unit_price])
  end

  it 'can find all items by a range price search' do
    merchant = create(:merchant)
    item1 = create(:item, unit_price: 100.99, merchant_id: merchant.id)
    item2 = create(:item, unit_price: 150.99, merchant_id: merchant.id)
    item3 = create(:item, unit_price: 211.00, merchant_id: merchant.id)
    item4 = create(:item, unit_price: 130.55, merchant_id: merchant.id)
    high_price = 150.00
    low_price = 130.00

    get "/api/v1/items/find?max_price=#{high_price}&min_price=#{low_price}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    items = parsed[:data]
    expect(response).to be_successful

    results = items.map do |item|
      item[:attributes][:unit_price]
    end
    expect(results).to eq([item4.unit_price])
  end
end
