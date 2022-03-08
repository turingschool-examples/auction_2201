class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidding = "open"
  end

  def add_bid(attendee, bid)
    if @bidding == "open"
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @bidding = "closed"
  end

end
