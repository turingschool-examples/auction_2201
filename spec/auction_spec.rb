require 'rspec'
require './lib/auction'

describe Auction do
  before :each do
    @auction = Auction.new
  end

  context 'initialization' do
    it 'exists' do
      expect(@auction).to be_a(Auction)
    end

    it 'starts with no items' do
      expect(@auction.items).to eq([])
    end
  end

  context 'adding items' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
    end

    it 'Auction #add_item' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'Auction #item_names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
end
