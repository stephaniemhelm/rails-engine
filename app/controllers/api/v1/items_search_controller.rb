class Api::V1::ItemsSearchController < ApplicationController

  def index
    find_names = Item.find_all_items(params[:name])
    render json: ItemSerializer.new(find_names)
  end

  def show
    if params[:name]
      find_name = Item.find_item(params[:name])
      render json: ItemSerializer.new(find_name)
    elsif params[:max_price] && params[:min_price]
      find_range = Item.range(params[:max_price], params[:min_price])
      render json: ItemSerializer.new(find_range)
    elsif params[:max_price]
      find_items = Item.max_price(params[:max_price])
      render json: ItemSerializer.new(find_items)
    elsif params[:min_price]
      find_items = Item.min_price(params[:min_price])
      render json: ItemSerializer.new(find_items)
    else
      render status: :not_found
    end
  end
end
