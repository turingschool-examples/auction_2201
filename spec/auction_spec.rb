require 'pry'
require './lib/item'
require './lib/auction'

RSpec.describe Auction do
  context 'Iteration 1' do
    before(:each) do
      @auction = Auction.new
    end

    it 'exists ' do
      expect(@auction).to be_a(Auction)
    end

    it 'Auction #item is an empty array' do
      expect(@auction.items).to eq([])
    end
  end
  context 'Auction adding items' do
    before(:each) do
      @auction = Auction.new
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')

      @auction.add_item(@item1)
      @auction.add_item(@item2)
    end

    it 'Auction #add_item' do
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'Auction #item populates after #add_item' do
      expect(@auction.items_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
end
