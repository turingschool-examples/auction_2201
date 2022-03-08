require 'rspec'
require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  before (:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  end

  it 'exists' do
    expect(@item1).to be_an_instance_of(Item)
  end

  it "has readable attribute'name'" do
    expect(@item1.name).to eq('Chalkware Piggy Bank')
    expect(@item2.name).to eq('Bamboo Picture Frame')
  end

  it "holds empty hash of bids by default" do
    expect(@item1.bids).to eq({})
  end

  it "adds bids to bids hash" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bids).to eq({@attendee2 => 20,
      @attendee1 => 22})
  end

  it "returns current highest bid" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.current_high_bid).to eq(22)
  end

  it 'prevents additional bids during close bidding' do
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    @item1.close_bidding

    expect(@item1.bids).to eq({@attendee2 => 20,
      @attendee1 => 22})

    @item1.add_bid(@attendee3, 70)

    expect(@item1.bids).to eq({@attendee2 => 20,
      @attendee1 => 22})
  end

end
