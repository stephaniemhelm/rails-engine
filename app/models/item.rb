class Item < ApplicationRecord
  belongs_to :merchant

  def merchant_data
    self.merchant
  end
end
