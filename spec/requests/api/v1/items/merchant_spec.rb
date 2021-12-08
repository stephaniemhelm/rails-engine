require 'rails_helper'

describe 'Items API' do
  it 'can get merchant name for given item' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item1.id}/merchant"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    #require "pry"; binding.pry
    expect(item[:data][:attributes][:list_items].first).to have_key(:name)
    expect(item[:data][:attributes][:list_items].first[:name]).to be_a(String)
    expect(item[:data][:attributes][:list_items].first[:name]).to eq(merchant.name)
  end
end
