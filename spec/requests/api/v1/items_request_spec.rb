require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful
    items = JSON.parse(response.body)
  end

  it "sends a list of items" do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)
    item3 = create(:item, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(3)

    expect(items[:data].first[:attributes][:id]).to eq(item1.id)
    expect(items[:data].first[:attributes][:id]).to be_a(Integer)

    expect(items[:data].first[:attributes][:name]).to eq(item1.name)
    expect(items[:data].first[:attributes][:name]).to be_a(String)

    expect(items[:data].first[:attributes][:description]).to eq(item1.description)
    expect(items[:data].first[:attributes][:description]).to be_a(String)

    expect(items[:data].first[:attributes][:unit_price]).to eq(item1.unit_price)
    expect(items[:data].first[:attributes][:unit_price]).to be_a(Float)

    expect(items[:data].first[:attributes][:merchant_id]).to eq(item1.merchant_id)
    expect(items[:data].first[:attributes][:merchant_id]).to be_a(Integer)
  end

  it 'can get an item by its id' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item1.id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(item[:data][:attributes]).to have_key(:id)
    expect(item[:data][:attributes][:id]).to eq(item1.id)

    expect(item[:data][:attributes][:name]).to eq(item1.name)
    expect(item[:data][:attributes][:name]).to be_a(String)

    expect(item[:data][:attributes][:description]).to eq(item1.description)
    expect(item[:data][:attributes][:description]).to be_a(String)

    expect(item[:data][:attributes][:unit_price]).to eq(item1.unit_price)
    expect(item[:data][:attributes][:unit_price]).to be_a(Float)

    expect(item[:data][:attributes][:merchant_id]).to eq(item1.merchant_id)
    expect(item[:data][:attributes][:merchant_id]).to be_a(Integer)
  end

  it 'can create a new item' do
    merchant = create(:merchant)

    item_params = ({
                    name: 'Couch',
                    description: 'Soft, warm and cozy',
                    unit_price: 499.9,
                    merchant_id: merchant.id
                    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)

    created_item = Item.last

    expect(response).to be_successful
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end

  it 'can update an existing item' do
    merchant = create(:merchant)
    id = create(:item, merchant_id: merchant.id).id
    previous_name = Item.last.name
    item_params = { name: 'Sofa'}

    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq('Sofa')
  end

  it 'can destory an item' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)

    expect(Item.count).to eq(1)
    delete "/api/v1/items/#{item1.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

end
