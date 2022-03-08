require 'pry'
require 'rspec'
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  before(:each) do
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

  it '#bidders' do


    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expected = ["Megan", "Bob", "Mike"]
    expect(@auction.bidders).to eq(expected)
  end

  it 'Item: #close_bidding' do

    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    
    expected = {
                  @attendee1 => 22,
                  @attendee2 => 20
               }
    expect(@item1.bids).to eq (expected)

    @item1.close_bidding
    @item1.add_bid(@attendee3, 70)

    expect(@item1.bids).to eq (expected)
  end

  xit '#bidder_info' do
  expected =  { @attendee1 => {
         :budget => 50,
         :items => [@item1]
       },
       @attendee2 => {
         :budget => 75,
         :items => [@item1,@item2]
       },
       @attendee3 =>
       {
         :budget => 100,
         :items => [@item3]
       }
     }
  end
end
