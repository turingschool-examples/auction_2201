require './lib/auction'

RSpec.describe Auction do
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
  end

  it "Auction has attributes" do
    expect(@auction.items).to eq([])
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.items).to eq([@item1, @item2])
    expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
  end

  it "can take bids" do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    expect(@item1.bids).to eq({})
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
  end
end