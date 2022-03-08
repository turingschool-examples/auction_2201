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

  describe 'Iteration 2' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookie')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    it 'finds items with no current bids' do
      item4.add_bid(attendee3, 50)
      expect(auction.unpopular_items).to eq [item2, item3, item5]
      item3.add_bid(attendee2, 15)
      expect(auction.unpopular_items).to eq [item2, item5]
    end

    it 'Finds all items with bids' do
      expect(auction.popular_items).to eq [item1, item3, item4]
    end

    it 'finds all top bids for items with bids' do
      expect(auction.top_bids).to eq [22, 15, 50]
    end

    it 'Finds potential revenue from current highest bids' do
      expect(auction.potential_revenue).to eq 87
    end
  end

  describe 'Iteration 3' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookie')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee1, 22)
    item1.add_bid(attendee2, 20)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    it 'shows all Attendee instances with bids' do
      expect(auction.unique_bidders).to eq [attendee1, attendee2, attendee3]
    end

    it 'Tells you everyone who has bid on items at the auction' do
      expect(auction.bidders).to eq ['Megan', 'Bob', 'Mike']
    end
  end

end