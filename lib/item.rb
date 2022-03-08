class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_open = true
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid if @bidding_open
  end

  def current_high_bid
    return 0 if @bids.values.sort.last.nil?
    @bids.values.sort.last
  end

  def close_bidding
    @bidding_open = false
  end

end
