require './lib/auction'
require './lib/item'


RSpec.describe Auction do

  auction = Auction.new


  item1 = Item.new("Chalkware Piggy Bank")
  item2 = Item.new("Bamboo Picture Fram")

  it 'exists' do
    expect(auction).to be_a(Auction)
  end

  it 'has a way to store data' do
    expect(auction.items).to eq([])
  end

  it 'can display items and their names' do
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq([item1,item2])
    expect(auction.item_names).to eq([item1.name,item2.name])
  end

end
