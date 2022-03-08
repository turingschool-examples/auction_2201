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

  
end
