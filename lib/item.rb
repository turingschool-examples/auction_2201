class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @bidding_open = true
  end

  def add_bid(bidder, amount)
    @bids[bidder] = amount if @bidding_open
  end

  def current_high_bid
    @bids.values.max
  end

  def bidding_open?
    @bidding_open
  end

  def close_bidding
    @bidding_open = false
  end
end
