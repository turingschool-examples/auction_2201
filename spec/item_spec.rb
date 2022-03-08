require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  before (:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  describe 'initialize' do
    it 'exists' do
      expect(@item1).to be_a(Item)
    end

    it 'has attributes' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item1.bids).to eq({})
      expect(@item2.name).to eq('Bamboo Picture Frame')
      expect(@item2.bids).to eq({})
    end
  end
end
