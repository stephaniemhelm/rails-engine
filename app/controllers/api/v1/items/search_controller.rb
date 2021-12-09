class Api::V1::Items::SearchController < ApplicationController

  def index
    #require "pry"; binding.pry
    render json: ItemSerializer.new(Item.find_all_items(item_params))
  end

  def show
    #require "pry"; binding.pry
    render json: ItemSerializer.new(Item.find_item(item_params))
  end

  private
    def item_params
      params.permit(:name, :description, :unit_price, :merchant_id)
    end
end
