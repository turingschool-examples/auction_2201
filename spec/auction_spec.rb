require './lib/auction'
require './lib/item'

RSpec.describe 'Auction' do
  describe 'Iteration 1' do
    auction = Auction.new

    it 'Has an empty items array' do
      expect(auction.items).to eq []
    end

    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    it 'Can add items to the items array' do
      auction.add_item(item1)
      auction.add_item(item2)
      expect(auction.items).to eq ([item1, item2])
    end

    it 'retrieves item names' do
      expect(auction.item_names).to eq [item1.name, item2.name]
    end
  end
end