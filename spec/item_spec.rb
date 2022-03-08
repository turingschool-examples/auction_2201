require './lib/item'

RSpec.describe 'Item' do
  describe 'Iteration 1' do
    item1 = Item.new('Chalkware Piggy Bank')

    it 'Has a readable name attribute' do
      expect(item1.name).to eq 'Chalkware Piggy Bank'
    end
  end

  describe 'Iteration 2' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookie')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    it 'Has a bids attribute' do
      expect(item1.bids).to eq({})
    end

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

    it 'can add bids to an item' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end

    it 'finds current highest bid in bids' do
      expect(item1.current_highest_bid).to eq 22
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

    it 'Closes bidding on individual items' do
      expect(item1.bids).to eq({ attendee1 => 22, attendee2 => 20 })
      item1.close_bidding
      item1.add_bid(attendee3, 70)
      expect(item1.bids).to eq({ attendee1 => 22, attendee2 => 20 })
    end
  end

end