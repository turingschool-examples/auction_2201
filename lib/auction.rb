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
    @items.find_all { |item| item.bids.empty? }
  end

  def potential_revenue
    money = 0
    @items.each do |item|
      money += item.current_high_bid if !item.bids.empty?
    end
    money
  end
end