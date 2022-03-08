require './lib/item'
require './lib/attendee'
require './lib/auction'

describe Auction do


  before (:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end
  it 'exists' do
    expect(@auction).to be_a Auction
  end

  it 'has no items when initialized' do
    expect(@auction.items).to eq []
  end

  it 'adds items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.items).to eq [@item1, @item2]
  end

  it 'lists item names' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.item_names).to eq [@item1.name, @item2.name]
  end
end
