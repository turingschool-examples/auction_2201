require './lib/auction'
require './lib/item'


RSpec.describe Auction do

  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
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
    require 'pry'; binding.pry
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

end
