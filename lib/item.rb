class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end


  def add_bid(name, bid)
    @bids[name] = bid
  end

end
