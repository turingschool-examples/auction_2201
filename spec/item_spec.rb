require './lib/item'
require 'pry'

RSpec.describe Item do

  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  end

  context 'Iteration 1' do
    it 'is initialized with a name' do
      expect(@item1.name).to eq("Chalkware Piggy Bank")
    end
  end

  context 'Iteration 2' do
    it 'is initialized without any bids' do
      expect(@item1.bids).to eq({})
    end

    it 'can add bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({
        @attendee2 => 20,
        @attendee1 => 22,
        })
    end

    it 'can detect the current highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end
  end
end
