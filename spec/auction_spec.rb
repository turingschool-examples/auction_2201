require './lib/auction'
require './lib/item'

RSpec.describe do

  it "exist" do
    auction = Auction.new
    expect(auction).to be_an_instance_of(Auction)
  end

  it "has items" do
    auction = Auction.new
    expect(auction.items).to eq([])
  end

  it "can add items" do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    expect(auction.add_item(item1)).to eq(["Chalkware Piggy Bank"])
  end

end
