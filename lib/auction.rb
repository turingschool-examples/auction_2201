class Auction
  attr_reader :items

  def initialize
    @items = Array.new(0)
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    lowest_bid_count = @items.map { |items| items.bids.count }.min
    @items.find_all { |items| items.bids.count <= lowest_bid_count }
  end

  def items_bid_on
    items.find_all { |item| item.bids != {} }
  end

  def potential_revenue
    items_bid_on.map { |item| item.current_high_bid }.sum
  end

  def bidders
    bidders = @items.flat_map { |item| item.bids.keys }.uniq
    bidders.map { |attendee| attendee.name }
  end
end
