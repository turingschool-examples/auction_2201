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

  it "#add_item can add an item" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(item1)
    @auction.add_item(item2)
    expect(@auction.items).to eq([item1,item2])
  end

  it "#item_names can get item names" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(item1)
    @auction.add_item(item2)
    expected = ["Chalkware Piggy Bank", "Bamboo Picture Frame"]

    expect(@auction.item_names).to eq(expected)
  end
end
