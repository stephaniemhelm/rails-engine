require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)
    require "pry"; binding.pry
  end
end
