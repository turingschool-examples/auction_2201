

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
    @items.map {|item| item if item.bids == {}}.compact
  end

  def potential_revenue
    @items.map {|item| item.current_high_bid}.compact.sum
  end

  def bidders
    @items.map {|item|
      item.bids.keys.map {|attendee| attendee.name}}.flatten.uniq
  end

end
