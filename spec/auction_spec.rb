require './lib/auction'
require './lib/attendee'
require './lib/item'


RSpec.describe Auction do

  auction = Auction.new

  attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
  attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

  item1 = Item.new("Chalkware Piggy Bank")
  item2 = Item.new("Bamboo Picture Fram")
  item3 = Item.new('Homemade Chocolate Chip Cookies')
  item4 = Item.new('2 Days Dogsitting')
  item5 = Item.new('Forever Stamps')

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

  it 'can display current bids per item' do
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    expect(item1.bids).to eq({})
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
  end

end
