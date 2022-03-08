require './lib/auction'

RSpec.describe Auction do

  before :each do
    @auction = Auction.new
  end

  it "initializes with an empty items attribute" do
    expect(@auction.items).to eq([])
  end
  
end
