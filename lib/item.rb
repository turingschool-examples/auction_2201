class Item
  attr_reader :bids,
              :name

  def initialize(name)
    @bids = Hash.new(0)
    @name = name
  end

  def add_bid(attendee, amount)
    @bids[attendee] += amount.to_i
  end

  def current_high_bid
    @bids.values.max
  end
end
