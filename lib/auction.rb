class Auction
  attr_reader :items

  def initialize()
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    items.map do |item|
      item.name
    end
  end
  
  def unpopular_items
    items.find_all { |item| item.bids == {} }
  end

  def potential_revenue
    items.map { |item| item.current_highest_bid }
  end
end