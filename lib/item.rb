class Item
  attr_reader :bids,
              :name

  def initialize(name)
    @bids = Hash.new(0)
    @name = name
    @open = true
  end

  def add_bid(attendee, amount)
    @bids[attendee] += amount.to_i if @open == true
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @open = false
  end
end
