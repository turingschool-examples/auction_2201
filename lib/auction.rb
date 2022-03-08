require "./item"
require "./attendee"

class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item| item.name
    end
  end

  def total_bids(item)
      total_bids = item.bids.values.sum.to_i
  end

  def unpopular_items
    unpopular_items = []
    @items.each do |item|
      if total_bids(item) == 0
        unpopular_items << item
      end
    end
    unpopular_items
  end

  def potential_revenue
    potential_revenue = []
    @items.each do |item|
      if item.current_high_bid != 0 && !unpopular_items.include?(item)
        potential_revenue << item.current_high_bid
      end
    end
    potential_revenue.sum
  end

end
