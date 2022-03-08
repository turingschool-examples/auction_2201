require './lib/item'
require './lib/auction'
require './lib/attendee'

  RSpec.describe Auction do
    it 'exists and has an empty array' do
      auction = Auction.new
      expect(auction).to be_an_instance_of(Auction)
      expect(auction.items).to be_a(Array)
      expect(auction.items).to eq([])
    end

    it 'exists and has an empty array' do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      # expect(auction).to be_an_instance_of(Auction)
      # expect(auction.items).to be_a(Array)
      # expect(auction.items).to eq([])
      auction.add_item(item1)
      auction.add_item(item2)
      expect(auction.items).to eq([item1, item2])
      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end

    it 'unpoplular items at the auction' do
       item1 = Item.new('Chalkware Piggy Bank')
       item2 = Item.new('Bamboo Picture Frame')
       item3 = Item.new('Homemade Chocolate Chip Cookies')
       item4 = Item.new('2 Days Dogsitting')
       item5 = Item.new('Forever Stamps')
       attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
       attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
       attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
       auction = Auction.new
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      expect(auction.unpopular_items).to eq([item2, item3, item5])
    end

end
