require 'pry'
require 'rspec'
require './lib/auction'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  it "#exists" do
    expect(@auction).to be_an_instance_of(Auction)
  end

  it "has attributes" do
    expect(@auction.items).to eq([])
  end
end
