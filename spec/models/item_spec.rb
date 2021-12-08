require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:merchant_id) }
  end

  it 'can find one item by name search' do
    merchant = create(:merchant)
    item1 = create(:item, name: 'Sanders', merchant_id: merchant.id)
    item2 = create(:item, name: 'Seashells and Sand', merchant_id: merchant.id)
    item3 = create(:item, name: 'Sandy Picture', merchant_id: merchant.id)
    item4 = create(:item, name: 'Farm Picture', merchant_id: merchant.id)

    expect(Item.find_item('sand')).to eq(item1)

  end

  it 'can find a list of items by name search' do
    merchant = create(:merchant)
    item1 = create(:item, name: 'Sanders', merchant_id: merchant.id)
    item2 = create(:item, name: 'Seashells and Sand', merchant_id: merchant.id)
    item3 = create(:item, name: 'Sandy Picture', merchant_id: merchant.id)
    item4 = create(:item, name: 'Farm Picture', merchant_id: merchant.id)

    expect(Item.find_all_items('sand')).to eq([item1, item2, item3])

  end
end
