require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    @auction = Auction.new
  end
  describe '#iteration_1 - item' do
    it 'exists' do

      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end

    it 'can read an item name' do

      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end

    it 'keeps a record of bidders names' do
      expect(@item1.bidders).to eq([])
      @item1.add_bid(@attendee, 10)

      expect(@item1.bidders).to eq(['Megan'])
    end
  end
end
