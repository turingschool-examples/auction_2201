class Item 
attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid if @open == true
  end
  
  def current_high_bid
    @bids.map {|attendee, bid| bid}.max
  end
  
end 
