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
    @items.find_all {|item| item.bids.empty?}
  end

  def top_bids
    @items.map {|item| item.current_high_bid}.compact
  end

  def potential_revenue
    top_bids.sum
  end

  def bidders
    @items.map do |item|
      item.bids.map {|attendee, bid| attendee.name}
    end.flatten
  end
end
