class Api::V1::Items::SearchController < ApplicationController

  def index 
    render json: ItemSerializer.new(Item.find_all_items)
  end

  def show
    render json: ItemSerializer.new(Item.find_item)
  end
end
