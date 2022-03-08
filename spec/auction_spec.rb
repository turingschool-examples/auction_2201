 require './lib/auction'
require 'pry'

RSpec.describe Auction do

  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  context 'Iteration 1' do
    it 'is initialized without any items' do
      expect(@auction.items).to eq([])
    end

    it 'can add items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'can identify the names of each item in its collection' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end

  context 'Iteration 2' do
    it 'can find all items without any bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
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

    it 'can determine potential revenue based on current high bids for each item' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
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

  context 'Iteration 3' do
    it 'can determine the names of all attendees who have bid on any items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
    end

    it 'can create a hash of attendee keys with hash values containing their budgets and items bid on' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.bidder_info).to eq({
        @attendee1 => {
          :budget => 50,
          :items => [@item1]
          },
        @attendee2 => {
          :budget => 75,
          :items => [@item1, @item3]
          },
        @attendee3 => {
          :budget => 100,
          :items => [@item4]
          }
        })
    end
  end

  context 'Iteration 4' do
    it 'can return the date in dd/mm/yyyy format' do
      expect(@auction.date).to eq('08/03/2022')

      # I was unable to get the below stub working, but I wanted to give it a shot.
      # The test for today's date is passing.

      # auction1 = double('auction')
      # allow(auction1).to receive(:date) { Date.parse('2020-02-24')}
      # expect(auction1.date).to eq('24/02/2020')
    end

    it 'can close the auction and return a closing summary hash' do
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
      expect(@auction.close_auction).to eq({
        @item1 => @attendee2,
        @item2 => "Not Sold",
        @item3 => @attendee2,
        @item4 => @attendee3,
        @item5 => @attendee1
        })
    end
  end
end
