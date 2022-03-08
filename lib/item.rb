class Item

  attr_reader :name, :bids

  def initialize (name)
    @name = name
    @bids = {}
  end

  def add_bid (attendee_obj, bid)
    @bids[attendee_obj] = bid
  end

  def current_high_bid
    high_bid = 0
    @bids.each_value {|value| high_bid = value if value > high_bid}
    high_bid
  end

end
