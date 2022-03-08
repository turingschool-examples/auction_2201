require 'attendee'

class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_open = true
  end

  def add_bid(attendee, amount)
    if @bidding_open == true
      @bids[attendee] = amount
    end
  end

  def current_high_bid
    bid_amounts = []
    @bids.each do |key, value|
      bid_amounts << value
    end
    bid_amounts.max
  end

  def close_bidding
    @bidding_open = false
  end


end
