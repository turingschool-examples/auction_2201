require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  before (:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Charlie', budget: '$100'})
    @attendee3 = Attendee.new({name: 'Jazz', budget: '$80'})
  end

  it 'has a name' do
    expect(@item1.name).to eq('Chalkware Piggy Bank')
    expect(@item2.name).to eq('Bamboo Picture Frame')
  end

  it 'starts with no bids' do
    expect(@item1.bids).to eq({})
  end

  it 'can add bids' do
    @item1.add_bid(@attendee1, 20)
    @item1.add_bid(@attendee2, 24)
    expect(@item1.bids).to eq({@attendee1 => 20, @attendee2 => 24})
  end

  it 'can see the highest bid' do
    @item1.add_bid(@attendee1, 20)
    @item1.add_bid(@attendee2, 24)
    expect(@item1.current_high_bid).to eq(24)
  end

  it 'can close bidding' do
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item1.close_bidding
    @item1.add_bid(@attendee3, 70)
    expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
  end

end
