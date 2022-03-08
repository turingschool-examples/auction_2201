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
      @attendee2 => 22})
  end

end
