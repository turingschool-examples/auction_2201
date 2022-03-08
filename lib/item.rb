class Item
  attr_reader :name, :bids, :bidder_names

  def initialize(name)
    @name = name
    @bids = {}
    @bidder_names = []
    @bidding_status = true
  end

  def add_bid(attendee, bid)
    if @bidding_status == true
      @bids[attendee] = bid
      @bidder_names << attendee.name
    end
  end

  def current_high_bid
    bid_array = @bids.map {|attendee, item| item}.sort.reverse
    bid_array[0]
  end

  def close_bidding
    @bidding_status = false
  end

end
