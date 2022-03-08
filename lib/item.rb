class Item

  attr_reader :name, :bids, :bidder_names

  def initialize(name)
    @name = name
    @bids = {}
    @bidder_names = []
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
    @bidder_names << attendee.name
  end

  def current_high_bid
    bid_array = @bids.map {|attendee, item| item}.sort.reverse
    bid_array[0]
  end

end
