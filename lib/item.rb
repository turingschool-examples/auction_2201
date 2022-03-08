require 'pry'

class Item
  attr_reader :bids, :name

  def initialize(name)
    @bids = {}
    @name = name
  end

  def add_bid(attendee, bid)
    if @bids[attendee]
      @bids[attendee] << bid
    else
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    

  end

end
