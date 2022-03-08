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

  it 'Item has bids' do
    expect(@item1.bids).to eq ({})
  end

  it 'Item #add_bid' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expected = {
                  @attendee2 => 20,
                  @attendee1 => 22
               }
    expect(@item1.bids).to eq (expected)
  end

  it 'Item has #current_high_bid' do

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@item1.current_high_bid).to eq(22)
  end

  it '#unpopular_items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)

    expected = [@item2, @item3, @item5]
    expect(@auction.unpopular_items).to eq(expected)
    @item3.add_bid(@attendee2, 15)
    expected = [ @item2, @item5 ]
    expect(@auction.unpopular_items).to eq(expected)
  end

  it '#potential_revenue' do
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
