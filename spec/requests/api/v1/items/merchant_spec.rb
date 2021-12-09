require 'rails_helper'

describe 'Items API' do
  xit 'can get merchant for given item' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)

    require "pry"; binding.pry
    get "/api/v1/items/#{item1.id}/merchant"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to be_a(String)
    expect(item[:data][:attributes][:name]).to eq(merchant.name)
  end
end
