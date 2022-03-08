require './lib/attendee'
require 'pry'

class Item

  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    @bids.values.sort.reverse[0]
  end

end
