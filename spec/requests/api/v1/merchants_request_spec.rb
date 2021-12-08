require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)


    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)
  end

  it "sends a list of merchants" do
    #create_list(:merchant, 3)
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(3)

    expect(merchants[:data].first[:attributes][:id]).to eq(merchant1.id)
    expect(merchants[:data].first[:attributes][:id]).to be_a(Integer)

    expect(merchants[:data].first[:attributes][:name]).to eq(merchant1.name)
    expect(merchants[:data].first[:attributes][:name]).to be_a(String)
  end

  it 'can get a merchant by its id' do
    merchant1 = create(:merchant)

    get "/api/v1/merchants/#{merchant1.id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(merchant[:data][:attributes]).to have_key(:id)
    expect(merchant[:data][:attributes][:id]).to eq(merchant1.id)

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String)
    expect(merchant[:data][:attributes][:name]).to eq(merchant1.name)
  end
end
