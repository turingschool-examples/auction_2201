require './lib/item'
require './lib/auction'
require './lib/attendee'


 RSpec.describe Auction do
 	before(:each) do
 		@auction = Auction.new

    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
 	end

 	it 'is initialized with an empty collection of items' do
 		expect(@auction).to be_instance_of(Auction)
    expect(@auction.items).to eq([])
 	end

  describe '#add_items' do
    before (:each) do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
    end

    it 'adds an item to the auction' do
      expected = [@item1, @item2]
      expect(@auction.items).to eq(expected)
    end

    describe 'item_names' do
      it 'returns a collections of the name of items' do
        expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
      end
    end
  end
 end
