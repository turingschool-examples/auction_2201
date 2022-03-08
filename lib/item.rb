class Item
  attr_reader :name, :bids, :close_bidding

  def initialize(name, bids = {}, close_bidding = {})
    @name = name
    @bids = bids
    @close_bidding = close_bidding
  end

  def add_bid(bidder, amount)
    @bids[bidder] = amount if @close_bidding[:on?] != true
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @close_bidding[:on?] = true
  end

end
