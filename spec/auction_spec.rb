require './lib/item.rb'
require './lib/auction.rb'
require './lib/attendee.rb'

  RSpec.describe Auction do
    before :each do
    @auction=Auction.new(items = [])
    end

  it 'exists' do
    expect(@auction).to be_a(Auction)
  end

    it 'has attributes' do
      expect(@auction.items).to eq([])
    end

    it 'can add items' do
      @auction.add_items(@item1)
      @auction.add_items(@items2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'can retrieve item names' do
      @auction.add_items(@item1)
      @auction.add_items(@items2)
      expected = @auction.item_names
      expect(expected).to eq(["Chaulkware Piggy Bank", "Bamboo Picture Frame"])
    end
end

context "iteration 2" do
    before :each do
      @auction = Auction.new
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
    end

    it 'can add bids to items' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@items1.bids).to eq({:attendee2 => 20, :attendee1 => 22})
    end
  end
