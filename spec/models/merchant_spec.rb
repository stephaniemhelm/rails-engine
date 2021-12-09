require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
    it { should validate_presence_of(:name) }
  end

  it 'can find one merchant by name search' do
    merchant1 = create(:merchant, name: 'Sanders')
    merchant2 = create(:merchant, name: 'Ellens')

    expect(Merchant.find_merchant('sand')).to eq(merchant1)
    expect(Merchant.find_merchant('sand')).to_not eq(merchant2)
  end

  it 'can find a list of merchants by name search' do
    merchant1 = create(:merchant, name: 'Sanders')
    merchant2 = create(:merchant, name: 'Ellens')
    merchant3 = create(:merchant, name: 'Sandy Hills')

    expect(Merchant.find_all_merchants('sand')).to eq([merchant1, merchant3])
  end
end
