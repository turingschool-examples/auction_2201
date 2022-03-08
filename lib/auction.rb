class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    names = @items.map { |item| item.name}
  end

  def unpopular_items
    unpopular_items = @items.find_all { |item| item.bids.empty?}
  end

  def potential_revenue
    binding.pry
  end
end
