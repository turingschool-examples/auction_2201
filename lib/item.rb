class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(attendee, bid_amount)
    @bids[attendee] += bid_amount
  end

  def current_high_bid
    max_bid = @bids.max_by { |attendee, bid_amount| bid_amount }
    if max_bid
      return max_bid.last
    end
    0
  end
end
