class Api::V1::ItemsSearchController < ApplicationController

  def index
    find_names = Item.find_all_items(params[:name])
    render json: ItemSerializer.new(find_names)
  end

  def show
    find_name = Item.find_item(params[:name])
    render json: ItemSerializer.new(find_name)
  end

  private
    def item_params
      params.permit(:name, :description, :unit_price, :merchant_id)
    end
end
