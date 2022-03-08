require './lib/auction'
require 'pry'
require 'rspec'

RSpec.describe Auction do
  before :each do
    @auction = Auction.new
  end

  it 'exists' do
    expect(@auction).to be_a(Auction)
  end

  it 'has attributes' do
    expect(@auction.items).to eq([])
  end

  it '#add_item' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(item1)
    @auction.add_item(item2)
    expect(@auction.items).to eq([item1, item2])
  end

  it '#item_names' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(item1)
    @auction.add_item(item2)
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end
end
