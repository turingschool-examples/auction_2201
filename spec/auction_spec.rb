require "rspec"
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
  
  before :each do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end 
  
  it "exists" do
    expect(@auction).to be_a(Auction)
    expect(@auction.items).to eq([])
  end
  it "adds an item" do
    auction.add_item(@item1)
    auction.add_item(@item2)
    expect(auction.items).to eq ([@item1, @item2])
  end




end 
