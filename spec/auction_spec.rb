require 'rspec'
require './lib/auction'

describe Auction do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  context 'initialization' do
    it 'exists' do
      expect(@auction).to be_a(Auction)
    end

    it 'starts with no items' do
      expect(@auction.items).to eq([])
    end

    it 'has a date' do
      expected = Date.today.to_s
      expect(@auction.date).to eq(expected)
    end
  end

  context 'adding items' do
    before :each do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
    end

    it 'Auction #add_item' do
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'Auction #item_names' do
      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end

  context 'queries on items and bids' do
    before :each do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
    end

    it 'Auction #unpopular_items' do
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])

      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it 'Auction #potential_revenue' do
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq(87)
    end

    it 'Auction #bidders' do
      expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
    end

    it 'Auction #bidder_info' do
      @item3.add_bid(@attendee2, 15)
      expected = {
        @attendee1 =>
          {
            :budget => 50,
            :items => [@item1]
          },
        @attendee2 =>
          {
            :budget => 75,
            :items => [@item1, @item3]
          },
        @attendee3 =>
          {
            :budget => 100,
            :items => [@item4]
          }
      }

      expect(@auction.bidder_info).to eq(expected)
    end
  end

  context 'closing the auction' do
    before do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee2, 30)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item5.add_bid(@attendee1, 35)
    end

    it 'Auction #close_auction' do
      expected = {
        @item1 => @attendee2,
        @item2 => 'Not Sold',
        @item3 => @attendee2,
        @item4 => @attendee3,
        @item5 => @attendee1
      }

      expect(@auction.close_auction).to eq(expected)
    end
  end
end
