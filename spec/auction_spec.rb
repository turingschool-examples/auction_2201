require 'pry'
require './lib/auction'
require './lib/item'
require './lib/attendee'

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
    expect(@auction).to be_an_instance_of(Auction)
  end

  it 'has attributes' do
    expect(@auction.items).to eq []
  end

  it 'adds items to the auction' do
    expect(@auction.items).to eq []
    @auction.add_item(@item1)
    expect(@auction.items).to eq [@item1]
  end

  it 'gets all the item names at the auction' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it "gets all the items without bids" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    expect(@auction.unpopular_items).to eq [@item2, @item5]
  end

  it 'adds up the highest bids for all the items' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    expect(@auction.potential_revenue).to eq 87
  end

  it "gets a list of names of all the bidders for any item" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    expect(@auction.bidders).to eq ["Bob", "Megan", "Mike"]
  end

  it "closes the auction to bidders" do
    @auction.add_item(@item1)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@auction.items[0].current_high_bid).to eq 22
    @auction.close_bidding
    @item1.add_bid(@attendee3, 40)
    expect(@auction.items[0].current_high_bid).to eq 22
  end

  it "gives detailed information on all the bidders" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    expect(@auction.bidder_info.length).to eq 3
    # expect()
  end

end
