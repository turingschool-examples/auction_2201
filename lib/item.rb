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
    bid_array = @bids.map {|attendee, item| item}.sort.reverse
    bid_array[0]
    # require 'pry'; binding.pry
  end

end
