require './lib/item'
require './lib/auction'
require './lib/attendee'

  RSpec.describe Auction do
    before :each do
  @auction=Auction.new(items = [])
  end

  it 'exists' do
    expect(@auction.to be_a(Auction)
  end



    it 'has attributes' do
      expect(@auction.items).to eq([])
    end

    it 'can add items' do
      @auction.add_items(@item1)
      @auction.add_items(@items2)
      expect(@auctions.items).to eq([@item1, @item2])
    end

    it 'can retrieve item names' do
      expected = auction.item_names
      expect(expected).to eq(["Chaulkware Piggy Bank", "Bamboo Picture Frame"])



end
