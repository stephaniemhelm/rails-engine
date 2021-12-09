require 'rails_helper'

describe "Mearchants Search API" do
  it 'can find one item by name search' do
    merchant1 = create(:merchant, name: 'Sanders')
    merchant2 = create(:merchant, name: 'Ellens')
    merchant3 = create(:merchant, name: 'Sandy Hills')
    name = 'sand'
    get "/api/v1/merchants/find?name=#{name}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    merchant = parsed[:data]

    expect(response).to be_successful

    expect(merchant[:attributes][:name]).to eq(merchant1.name)
  end

  it 'can find all merchants by name search' do
    merchant1 = create(:merchant, name: 'Sanders')
    merchant2 = create(:merchant, name: 'Ellens')
    merchant3 = create(:merchant, name: 'Sandy Hills')

    name = 'sand'
    get "/api/v1/merchants/find_all?name=#{name}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    merchants = parsed[:data]

    expect(response).to be_successful

    results = merchants.map do |merchant|
      merchant[:attributes][:name]
    end
    expect(results).to eq([merchant1.name, merchant3.name])
    expect(results).to_not eq([merchant2.name])
  end
end
