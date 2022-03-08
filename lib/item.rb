class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = {}
    @closed = false
  end

  def add_bid(attendee, bid)
    if @closed == false
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @closed = true
  end
end
