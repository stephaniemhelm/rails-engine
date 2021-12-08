require 'rails_helper'

describe 'Merchants API' do
  it 'can get items for given merchant' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)
    item3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    
    expect(merchant.items.first[:name]).to be_a(String)
    expect(merchant.items.first[:name]).to eq(item1[:name])
  end
end
