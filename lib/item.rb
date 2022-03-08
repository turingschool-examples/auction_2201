class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_closed = false
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid if !@bidding_closed
  end

  def current_high_bid
    nums = []
    @bids.map do |attendee, bid|
      nums << bid
    end
    nums.sort.reverse.first
  end

  def close_bidding
    @bidding_closed = true
  end
end