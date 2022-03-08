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

end
