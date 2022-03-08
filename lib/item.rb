class Item
  attr_reader :name, :bids, :bidders

  def initialize(name)
    @name = name
    @bids = {}
    @bidders = []
  end

  def add_bid(attendee, quantity)
    @bids[attendee] = quantity
    @bidders << attendee.name
  end

  def current_high_bid
    @bids.values.max
  end
end
