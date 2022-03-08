class Auction
  attr_reader :items
  def initialize
    @items = Array.new
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map{|item| item.name}
  end

  def unpopular_items
    @items.find_all{|no_bid| no_bid if no_bid.bids == {}}
  end

  def potential_revenue
    bids = @items.map {|item| item.current_high_bid}
    bids.compact.sum
  end
end
