require './lib/auction'

RSpec.describe 'Auction' do
  describe 'Iteration 1' do
    auction = Auction.new

    it 'Has an empty items array' do
      expect(auction.items).to eq []
    end
  end
end