
class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(attendee, bid)
    if !@bids.has_key?(attendee)
      @bids[attendee] = bid
      # require 'pry'; binding.pry
    end
    @bids[attendee]
  end

  def current_high_bid
    high_bid = []
    @bids.each do |attendee, bid|
      high_bid << bid
    end
    high_bid.max 
  end

end
