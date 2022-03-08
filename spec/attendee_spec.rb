require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank', bids = {})

    @item2 = Item.new("Bamboo Picture Frame", bids = {})
  end

  it 'exists' do
    expect(@item1).to be_a(Item)
    expect(@items2).to be_a(Item)
  end


  it 'has attributes' do
    expect(@item1.name).to eq("Chalkware Piggy Bank")
  end
