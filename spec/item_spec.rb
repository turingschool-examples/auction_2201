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










end
