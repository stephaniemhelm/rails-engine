class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant_id

  def self.find_item(item_search)
    where('name ILIKE ?', "%#{item_search}%")
    .first
  end

  def self.find_all_items(item_search)
    where('name ILIKE ?', "%#{item_search}%")
  end

  def self.min_price(price)
    where("unit_price >= #{price}")
  end

  def self.max_price(price)
    where("unit_price <= #{price}")
  end
end
