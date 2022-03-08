require './lib/auction'

RSpec.describe Auction do

  before :each do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it "initializes with an empty items attribute" do
    expect(@auction.items).to eq([])
  end

  it "adds items through an add_item method" do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq(@item1, @item2)
  end

  it "returns item names through a method item_names" do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

end
