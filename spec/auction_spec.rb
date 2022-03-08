require './lib/auction'
require 'pry'
require 'rspec'

RSpec.describe Auction do
  before :each do
    @auction = Auction.new
  end

  it 'exists' do
    expect(@auction).to be_a(Auction)
  end

  it 'has attributes' do
    expect(@auction.items).to eq([])
  end
end
