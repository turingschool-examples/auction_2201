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

  def sell
    wise_bidders = @bids.find_all do |attendee, bid|
      attendee if bid <= attendee.budget
    end.sort {|attendee| attendee[1]}
    wise_bidders.map! {|attendee| attendee[0]}
    wise_bidders[0].update_budget(@bids[wise_bidders[0]])
    wise_bidders[0]
  end
end
