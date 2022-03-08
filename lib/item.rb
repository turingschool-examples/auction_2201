class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    return 0 if @bids.values.sort.last.nil?
    @bids.values.sort.last
  end

end
