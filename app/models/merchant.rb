class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  validates_presence_of :name

  def self.find_merchant(merchant_search)
    where('name ILIKE ?', "%#{merchant_search}%")
    .first
  end

  def self.find_all_merchants(merchant_search)
    where('name ILIKE ?', "%#{merchant_search}%")
  end

  def self.top_merchants_by_revenue(number)
    self.joins(invoices: [:transactions, :invoice_items])
    .where(invoices: {status: 'shipped'}, transactions: {result: 'success'})
    .group(:id)
    .select("SUM(invoice_items.unit_price * invoice_items.quantity) as total_revenue, merchants.*")
    .order(total_revenue: :desc)
    .limit(number)
  end

  def self.top_merchants_by_items_sold(number)
    self.joins(invoices: [:transactions, :invoice_items])
    .where(invoices: {status: 'shipped'}, transactions: {result: 'success'})
    .group(:id)
    .select("SUM(invoice_items.quantity) as items_sold, merchants.*")
    .order(items_sold: :desc)
    .limit(number)
  end


end
