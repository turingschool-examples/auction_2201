require 'pry'
require './lib/auction'

RSpec.describe Auction do
  context 'Iteration 1' do
    before(:each) do
      @auction = Auction.new
    end

    it 'exists ' do
      expect(@uaction).to be_a(Auction)
    end

    it 'Auction #item is an empty array' do
      expect(@auction.items).to eq([])
    end
  end
end
