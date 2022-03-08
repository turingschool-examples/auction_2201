require './lib/auction'
require './lib/item'

RSpec.describe Auction do
  before (:each) do
    @auction = Auction.new
  end

  it 'initializes with no items' do
    expect(@auction.items).to eq([])
  end

end
