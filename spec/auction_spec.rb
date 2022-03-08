require "rspec"
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
  
  before :each do
    @auction = Auction.new
  end 
  
  it "exists" do
    expect(@auction).to be_a(Auction)
    expect(@auction.items).to eq([])
  end




end 
