class Auction

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.map do |item|
      if item.bids.empty?
        item
      end
    end.compact
  end

  def potential_revenue
    array_sum = []
    @items.each do |item|
      array_sum << item.current_high_bid
    end
    array_sum.compact.sum
  end


end
