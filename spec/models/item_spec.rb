require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
  end

  it 'can list merchant data' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)

    expect(item1.merchant_data).to eq(merchant)

  end
end
