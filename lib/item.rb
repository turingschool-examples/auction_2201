class Item

  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidstatus = :open
  end

  def add_bid(bidder, bid)
    if @bidstatus == :open
      @bids[bidder] = bid
    else
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @bidstatus = :close
  end
end
