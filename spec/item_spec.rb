require 'rspec'
require './lib/item'

describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  context 'initialization' do
    it 'exists' do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end

    it 'has a name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item2.name).to eq('Bamboo Picture Frame')
    end

    it 'starts with no bids' do
      expect(@item1.bids).to eq({})
      expect(@item2.bids).to eq({})
    end
  end
end
