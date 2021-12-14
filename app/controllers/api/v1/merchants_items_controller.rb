class Api::V1::MerchantsItemsController < ApplicationController

  def index
    number = params[:quantity]
    merchants = Merchant.top_merchants_by_items_sold(number)
    render json: MerchantNameItemSerializer.new(merchants).serializable_hash.to_json
  end
end
