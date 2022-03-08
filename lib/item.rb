class Item
  attr_reader :name, :bids
  attr_accessor :is_open
  def initialize(name)
    @name = name
    @bids = {}
    @is_open = true
  end

  def add_bid(attendee,bid)
    if is_open == true
      bids[attendee] = bid
    else
      return
    end
  end

  def current_high_bid
    high_bid = 0
    bids.each do |bid|
      if bid[1] > high_bid
        high_bid = bid[1]
      end
    end
    return high_bid
  end

  def close_bidding
    @is_open = false
  end
end
