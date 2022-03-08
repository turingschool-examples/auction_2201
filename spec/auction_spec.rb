require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Auction do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    @auction = Auction.new
  end
  describe '#auction' do
    it 'exists' do

      expect(@auction).to be_a(Auction)
    end

    it 'can hold items' do

      expect(@auction.items).to eq([])
    end

    it 'can add new items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'can return all item names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end
end
