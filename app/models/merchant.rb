class Merchant < ApplicationRecord
  has_many :items

  def list_items
    self.items
  end
end
