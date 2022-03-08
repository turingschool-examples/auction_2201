require 'pry'
require 'rspec'
require './lib/item'
require './lib/auction'
require './lib/attendee'


RSpec.describe 'auction' do

  it 'item has a name' do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq("Chalkware Piggy Bank")
  end

  it 'attendee atributes' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
  end

  it 'action starts with no items' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    auction = Auction.new
    expect(auction.items).to eq([])
  end

  it 'action adds items' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq([item1,item2])
  end

  it 'action adds items' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq([item1,item2])
    expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end




end
