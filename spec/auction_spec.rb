require './lib/auction'
require 'pry'
require 'rspec'

RSpec.describe Auction do
  context 'Iteration 1' do
    before :each do
      @auction = Auction.new
    end

    it 'exists' do
      expect(@auction).to be_a(Auction)
    end

    it 'has attributes' do
      expect(@auction.items).to eq([])
    end

    it '#add_item' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      @auction.add_item(item1)
      @auction.add_item(item2)
      expect(@auction.items).to eq([item1, item2])
    end

    it '#item_names' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      @auction.add_item(item1)
      @auction.add_item(item2)
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end
  context 'Iteration 2' do
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
    it 'begins with empty array of items' do
      expect(@auction.items).to eq([])
    end
  end
end
