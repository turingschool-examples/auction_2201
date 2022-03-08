require "./lib/item"
require "./lib/attendee"

describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Pggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    @auction = Auction.new
  end

  it "exists and has readable attributes" do
    expect(@auction).to be_a(Auction)
    expect(@auction.items).to eq([])
  end
end
