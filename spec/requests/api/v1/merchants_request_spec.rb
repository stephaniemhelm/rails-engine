require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)
  end

  it "sends a list of merchants" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(3)

    expect(merchants[:data].first[:attributes][:name]).to eq(merchant1.name)
    expect(merchants[:data].first[:attributes][:name]).to be_a(String)
  end

  it 'can get a merchant by its id' do
    merchant1 = create(:merchant)

    get "/api/v1/merchants/#{merchant1.id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String)
    expect(merchant[:data][:attributes][:name]).to eq(merchant1.name)
  end

  it 'sad path: 404 status and error message when id is not valid' do
    merchant1 = create(:merchant)
    invalid_id = merchant1.id + 1

    get "/api/v1/merchants/#{invalid_id}"

    merchant_parsed = JSON.parse(response.body, symbolize_names: true)
    
    expect(response.status).to eq(404)
    expect(merchant_parsed).to have_key(:errors)
    expect(merchant_parsed[:errors][:details]).to eq('This merchant id does not exist.')
  end
end
