class MerchantSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :list_items

  has_many :items
end
