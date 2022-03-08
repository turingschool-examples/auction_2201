require 'rspec'
require './lib/item'

describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  context 'initialization' do
    it 'exists' do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end

    it 'has a name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item2.name).to eq('Bamboo Picture Frame')
    end

    it 'starts with no bids' do
      expect(@item1.bids).to eq({})
      expect(@item2.bids).to eq({})
    end
  end

  context 'adding and closing bids' do
    before :each do
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

    it 'Item #add_bid' do
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end

    it 'Item #current_high_bid' do
      expect(@item1.current_high_bid).to eq(22)
    end

    it 'Item #close_bidding' do
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)

      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end
  end
end
