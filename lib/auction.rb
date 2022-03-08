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
end
