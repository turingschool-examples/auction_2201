require './lib/item'
require './lib/attendee'
require './lib/auction'

context 'iteration_3' do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
  end

  describe Auction do
    it 'lists bidders by name' do
      expect(@auction.bidders).to eq ["Megan", "Bob", "Mike"]
    end
  end
  describe Item do
    it 'does not accept bids after close_bidding' do
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)
      expect(@item1.bids).to eq ({@attendee2 => 20,@attendee1 => 22})
    end
  end
end 
