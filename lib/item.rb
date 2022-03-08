require 'attendee'

class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    bid_amounts = []
    @bids.each do |key, value|
      bid_amounts << value
    end
    bid_amounts.max
  end


end
