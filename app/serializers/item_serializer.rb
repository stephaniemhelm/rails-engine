class ItemSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id, :merchant_data

  belongs_to :merchant
end
