class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end

  def add_bid(attendee, bid)
      @bids[attendee] = bid if open?
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @open = false
  end

  def open?
    @open
  end
end
