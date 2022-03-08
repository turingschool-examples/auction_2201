require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do

  context 'Iteration 1' do

    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @attendee = Attendee.new({name: 'Megan', budget: '$50'})
      @auction = Auction.new
    end

    it 'item exists' do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end

    it 'Item has readable attritutes/name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item1.bids).to eq({})
    end

    it 'attendee exists' do
      expect(@attendee).to be_a(Attendee)
    end

    it 'Attendee has readable attritutes/name' do
      expect(@attendee.name).to eq('Megan')
      expect(@attendee.budget).to eq(50)
    end

    it 'auction exists' do
      expect(@auction).to be_a(Auction)
    end

    it 'Auction has readable attritutes/empty items array' do
      expect(@auction.items).to eq([])
    end

    it 'Auction can add items ' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'Auction can return item names  ' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame' ])
    end
  end

  context 'Iteration 2' do

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
    end

    it 'can add_bid to an item' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({
                                @attendee2 => 20,
                                @attendee1 => 22
                              })
    end

    it 'can return current_high_bid for an item' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end

    it 'can return unpopular_items test 1' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
    end

    it 'can return unpopular_items test 2' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end









  end










end
