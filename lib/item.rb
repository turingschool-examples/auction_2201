require './lib/attendee'
require 'pry'

class Item

  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
    @closed = false
  end

  def add_bid(attendee, bid)
    if !@closed
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    @bids.values.sort.reverse[0]
  end

  def closed?
    @closed
  end

  def close_bidding
    @closed = true
  end

end
