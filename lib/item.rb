class Item

  attr_reader :name, :bids

  def initialize (name)
    @name = name
    @bids = {}
    @closed = false
  end

  def add_bid (attendee_obj, bid)
    @bids[attendee_obj] = bid unless @closed == true
  end

  def current_high_bid
    high_bid = 0
    @bids.each_value {|value| high_bid = value if value > high_bid}
    high_bid
  end

  def close_bidding
    @closed = true
  end

end
