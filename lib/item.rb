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
    @bids.map { |attendee, bid|bid }.max
  end

  def close_bidding
    @bidding_open = false
  end


end
