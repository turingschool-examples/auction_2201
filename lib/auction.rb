class Auction
attr_reader :items
  def initialize
    @items = []

  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map {|item| item.name}
  end

  def unpopular_items
    @items.find_all{|item| item.bids =={}}
  end

  def potential_revenue
    valid_high_bids = @items.map{|item| item.current_high_bid}
    potential_revenue = 0
    valid_high_bids.map{|bid| potential_revenue += bid if bid != nil }
    potential_revenue
  end

  def bidders
    bidding_attendees = @items.map {|item| item.bids.keys}.flatten.uniq
    bidding_attendees.map{|bidder| bidder.name}
  end

end
