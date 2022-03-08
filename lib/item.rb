class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(bidder, price)
    bids[bidder] = price
  end

  def current_highest_bid
    bids.max_by{|k,v| v}[1]
  end
end