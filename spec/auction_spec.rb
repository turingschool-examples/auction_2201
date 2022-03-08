require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Auction do
  context "Iteration 1" do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')

      @attendee = Attendee.new({name: 'Megan', budget: '$50'})

      @auction = Auction.new
    end

    it 'exists' do
      expect(@auction).to be_an_instance_of(Auction)
    end

    it "has no items by default" do
      expect(@auction.items).to eq([])
    end

    it "can add items" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

  end
end
