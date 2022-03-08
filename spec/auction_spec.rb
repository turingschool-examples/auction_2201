require "./lib/item"
require "./lib/attendee"
require "./lib/auction"

RSpec.describe Auction do
  item1 = Item.new("Chalkware Piggy Bank")
  item2 = Item.new("Bamboo Picture Frame")
  auction = Auction.new

  it "exists/ has readable attributes" do
    expect(auction).to be_an_instance_of(Auction)
    expect(auction.items).to eq([])
  end
end
