require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Attendee do
  context "Iteration 1" do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')

      @attendee = Attendee.new({name: 'Megan', budget: '$50'})

      @auction = Auction.new
    end

    it 'exists' do
      expect(@attendee).to be_an_instance_of(Attendee)
    end

    it "has attributes" do
      expect(@attendee.name).to eq("Megan")
      expect(@attendee.budget).to eq(50)
    end

  end
end
