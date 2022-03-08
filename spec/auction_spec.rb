require './lib/auction'
require './lib/item'
require './lib/attendee'
require 'date'

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

  it 'exists' do
    expect(@auction).to be_a(Auction)
  end

  it 'has items' do
    expect(@auction.items).to eq([])
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.items).to eq([@item1,@item2])
  end

  it 'has names for the items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it 'has bids for items' do
    expect(@item1.bids).to eq({})
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bids).to eq(
                            {
                              @attendee2 => 20,
                              @attendee1 => 22
                            }
                          )
  end

  it 'has the current_high_bid' do
    expect(@item1.bids).to eq({})
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.current_high_bid).to eq(22)
  end

  it 'has unpopular_items' do
    expect(@item1.bids).to eq({})
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.current_high_bid).to eq(22)
    @item4.add_bid(@attendee3, 50)
    expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
  end

  it 'has an array of bidders and a hash of bids per item' do
    expect(@item1.bids).to eq({})
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
    expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
  end

  it 'can close bidding' do
    expect(@item1.bids).to eq({})
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    @item1.close_bidding
    @item1.add_bid(@attendee3, 70)
    expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
  end

  it 'can store bidder_info in a hash' do
    expect(@item1.bids).to eq({})
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    @item1.close_bidding
    @item1.add_bid(@attendee3, 70)
    expect(@auction.bidder_info).to eq(
      {
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
    )
  end

  it 'has a date' do
    expect(@auction.date).to eq("24/02/2020")
  end

end
