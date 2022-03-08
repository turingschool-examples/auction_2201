class Item
  attr_reader :name
  attr_accessor :bids
  def initialize(name)
    @name = name
    @bids = {}
    @close_bidding = false
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid if @close_bidding == false
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @close_bidding = true
  end


end
