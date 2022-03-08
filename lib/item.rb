class Item

  attr_reader :name, :bids

  def initialize (name)
    @name = name
    @bids = {}
  end

  def add_bid (attendee_obj, bid)
    @bids[attendee_obj] = bid
  end

end
