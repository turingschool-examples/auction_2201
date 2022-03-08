require './lib/item'
require './lib/auction'
require './lib/attendee'


 RSpec.describe Auction do
 	before(:each) do
 		@auction = Auction.new

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
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

    it 'can bid on items' do
      expect(@item1.bids).to eq({})
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({ @attendee2 => 20, @attendee1 => 22})
      expect(@item1.current_high_bid).to eq(22)
    end

    it 'can list unpopular_items' do
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it 'can determine potential_revenue' do
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end
 end
