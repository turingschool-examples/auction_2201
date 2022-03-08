class Item
  attr_reader :name, :bids, :bidders, :open_to_bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidders = []
    @open_to_bids = true
  end

  def add_bid(attendee, quantity)
    if @open_to_bids == true
      @bids[attendee] = quantity
      @bidders << attendee.name
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @open_to_bids = false
  end
end
