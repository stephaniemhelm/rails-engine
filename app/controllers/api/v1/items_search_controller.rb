class Api::V1::ItemsSearchController < ApplicationController

  def index
    find_names = Item.find_all_items(params[:name])
    render json: ItemSerializer.new(find_names)
  end

  def index_min_price
    find_items = Item.min_price(params[:unit_price])
    render json: ItemSerializer.new(find_items)
  end

  def index_max_price
    find_items = Item.max_price(params[:unit_price])
    render json: ItemSerializer.new(find_items)
  end

  def show
    find_name = Item.find_item(params[:name])
    render json: ItemSerializer.new(find_name)
  end
end
