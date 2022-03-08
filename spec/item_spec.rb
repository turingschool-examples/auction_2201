require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Item do
  context "Iteration 1" do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')

      @attendee = Attendee.new({name: 'Megan', budget: '$50'})

      @auction = Auction.new
    end

    it 'exists' do
      expect(@item1).to be_an_instance_of(Item)
    end

    it "has a name" do
      expect(@item1.name).to eq("Chalkware Piggy Bank")
    end

  end
end
