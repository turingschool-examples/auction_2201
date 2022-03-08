require 'rspec'
require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  it "exists" do
    auction = Auction.new
    expect(auction).to be_a(Auction)
  end
end
