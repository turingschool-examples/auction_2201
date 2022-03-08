require 'pry'
require './lib/item'
require './lib/attendee'

RSpec.describe Item  do

  before(:each) do
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @item1 = Item.new('Chalkware Piggy Bank')
  end

  it 'exists ' do
    expect(@item1).to be_an_instance_of(Item)
  end

  it 'has attributes' do
    expect(@item1.name).to eq('Chalkware Piggy Bank')
    expect(@item1.bids).to be {}
  end

  it 'adds bids on the item' do
    expect(@item1.bids).to be {}
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bids.length).to eq 2
    expect(@item1.bids.values[0]).to eq 20
    expect(@item1.bids.keys[0].class).to be Attendee
  end

  it 'gets the highest bid on the item' do
    expect(@item1.bids).to be {}
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.current_high_bid).to eq 22
  end

end
