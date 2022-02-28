require 'rspec'
require 'pry'
require 'simplecov'
SimpleCov.start
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
  config.default_formatter = 'doc'
  config.mock_with :mocha
end

RSpec.describe 'Auction Spec Harness' do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    @auction = Auction.new
  end

  describe 'Iteration 1' do
    it '1. Item Creation' do
      expect(Item).to respond_to(:new).with(1).argument
      expect(@item1).to be_an_instance_of(Item)
      expect(@item1).to respond_to(:name).with(0).argument
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end

    it '2. Attendee Creation' do
      expect(Attendee).to respond_to(:new).with(1).argument
      expect(@attendee1).to be_an_instance_of(Attendee)
      expect(@attendee1).to respond_to(:name).with(0).argument
      expect(@attendee1.name).to eq('Megan')
      expect(@attendee1).to respond_to(:budget).with(0).argument
      expect(@attendee1.budget).to eq(50)
    end

    it '3. Auction Creation' do
      expect(Auction).to respond_to(:new).with(0).argument
      expect(@auction).to be_an_instance_of(Auction)
    end

    it '4. Auction #add_item' do
      expect(@auction).to respond_to(:items).with(0).argument
      expect(@auction.items).to eq([])
      expect(@auction).to respond_to(:add_item).with(1).argument
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it '5. Auction #item_names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction).to respond_to(:item_names)
      expect(@auction.item_names).to eq([@item1.name, @item2.name])
    end
  end

  describe 'Iteration 2' do
    before :each do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
    end

    it '6. Item #add_bid' do
      expect(@item1).to respond_to(:bids).with(0).argument
      expect(@item1.bids).to eq({})
      expect(@item1).to respond_to(:add_bid).with(2).argument
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
    end

    it '7. Item #current_high_bid' do
      expect(@item1).to respond_to(:current_high_bid).with(0).argument
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      expect(@item1.current_high_bid).to eq(22)
    end

    it '8. Auction #unpopular_items' do
      expect(@auction).to respond_to(:unpopular_items)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it '9. Auction #potential_revenue' do
      expect(@auction).to respond_to(:potential_revenue).with(0).argument
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end

  describe 'Iteration 3' do
    before :each do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
    end

    it '10 Auction #bidder_names' do
      expect(@auction).to respond_to(:bidders).with(0).argument
      expect(@auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
    end

    it '11. Auction #bidder_info' do
      expect(@auction).to respond_to(:bidder_info)
      expected = {
        @attendee1 => {
          budget: 50,
          items: [@item1]
        },
        @attendee2 => {
          budget: 75,
          items: [@item1, @item3]
        },
        @attendee3 => {
          budget: 100,
          items: [@item4]
        }
      }
      expect(@auction.bidder_info).to eq(expected)
    end

    it '12. Item #close_bidding' do
      expect(@item1).to respond_to(:close_bidding).with(0).argument
      expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)
      expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
    end
  end

  describe 'Iteration 4' do
    it '13. Auction #date' do
      Date.expects(:today).returns(Date.new(2020, 02, 12))
      auction = Auction.new

      expect(auction).to respond_to(:date).with(0).argument
      expect(auction.date).to eq('12/02/2020')
    end

    it '14. Auction #close_auction' do
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

      expect(@auction).to respond_to(:close_auction).with(0).argument
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