class Item

  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(bidder, bid)
    @bids[bidder] = bid
  end
end
