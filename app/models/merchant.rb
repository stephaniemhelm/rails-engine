class Merchant < ApplicationRecord
  has_many :items

  validates_presence_of :name

  def self.find_merchant(merchant_search)
    where('name ILIKE ?', "%#{merchant_search}%")
    .first
  end

  def self.find_all_merchants(merchant_search)
    where('name ILIKE ?', "%#{merchant_search}%")
  end
end
