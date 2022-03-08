require './lib/auction'

RSpec.describe Auction do

  before(:each) do
    @auction = Auction.new
  end


  it 'exists' do
    expect(@auction).to be_a(Auction)
  end

  it 'has items' do
    expect(@auction.items).to eq([])
    @auction.add_item(item1)
    @auction.add_item(item2)
    expect(@auction.items).to eq([item1,item2])
  end



end
