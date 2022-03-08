class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(bidder, ammount)
    @bids[bidder] = ammount
  end

  def current_high_bid
    @bids.values.max
  end
end
