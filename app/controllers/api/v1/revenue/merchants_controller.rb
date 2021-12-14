class Api::V1::Revenue::MerchantsController < ApplicationController

  def index
    number = params[:quantity]
    merchants = Merchant.top_merchants_by_revenue(number)
    render json: MerchantNameRevenueSerializer.new(merchants).serializable_hash.to_json
  end
end
