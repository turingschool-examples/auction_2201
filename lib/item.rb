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
    nums = []
    @bids.map do |attendee, bid|
      nums << bid
    end
    nums.sort.reverse.first
  end
end