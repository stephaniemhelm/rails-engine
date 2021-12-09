require 'rails_helper'

describe "Items Search API" do
  xit 'can find one item by name search' do
    merchant = create(:merchant)
    item1 = create(:item, name: 'Sanders', merchant_id: merchant.id)
    item2 = create(:item, name: 'Seashells and Sand', merchant_id: merchant.id)
    item3 = create(:item, name: 'Sandy Picture', merchant_id: merchant.id)
    item4 = create(:item, name: 'Farm Picture', merchant_id: merchant.id)

    get '/api/v1/items/find?name=sand'

    item = JSON.parse(response.body)

    expect(response).to be_successful

    #require "pry"; binding.pry
    expect(item[:data][:attributes][:name]).to eq(item1.name)
  end

  xit 'can find all items by name search' do
    merchant = create(:merchant)
    item1 = create(:item, name: 'Sanders', merchant_id: merchant.id)
    item2 = create(:item, name: 'Seashells and Sand', merchant_id: merchant.id)
    item3 = create(:item, name: 'Sandy Picture', merchant_id: merchant.id)
    item4 = create(:item, name: 'Farm Picture', merchant_id: merchant.id)

    get '/api/v1/items/find?name=sand'


    expect(Item.find_item('sand')).to eq(item1)
    expect(response).to be_successful
    item = JSON.parse(response.body)
  end
end
