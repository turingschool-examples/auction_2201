class Item
  attr_reader :name, :bids

  def initialize(name, bids = {})
    @name = name
    @bids = bids
  end

  def add_bid(bidder, amount)
    @bids[bidder] = amount
  end

  def current_high_bid
    @bids.values.max
  end

end
