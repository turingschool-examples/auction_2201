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
    bid_arrqy = @bids.map {|attendee, item| item}.sort.reverse
    bid_arrqy[0]
  end

end
