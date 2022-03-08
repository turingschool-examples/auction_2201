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
    if @bids.count > 0
      @bids.values[0]
      if @bids.count > 1
        if @bids.values[1] > @bids.values[0]
          return @bids.values[1]
        else
          return @bids.values[0]
        end
      end
    # else
    #   return 0
    end
  end

end
