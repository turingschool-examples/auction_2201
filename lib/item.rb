class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(bidder, price)
    bids[bidder] = price
  end
end