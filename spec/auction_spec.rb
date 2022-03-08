require './lib/item'
require './lib/attendee'
require './lib/auction'

describe Auction do


  before (:each) do
    @auction = Auction.new
  end
  it 'exists' do
    expect(@auction).to be_a Auction
  end

  it 'has no items when initialized' do
    expect(@auction.items).to eq []
  end
end
