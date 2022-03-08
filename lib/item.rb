class Item
  attr_reader :name, :bids, :bidding

  def initialize(name)
    @name = name
    @bids = {}
    @bidding = true
  end

  def add_bid(bidder, price)
    if bidding
      bids[bidder] = price
    end
  end

  def current_highest_bid
    bids.max_by{|k,v| v}[1]
  end

  def close_bidding
    @bidding = false
  end
end