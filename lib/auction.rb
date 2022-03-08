require './lib/attendee'

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
    @items.select {|item| item.bids == {}}
  end

  def potential_revenue
    revenue = 0
    @items.each {|item| revenue += item.current_high_bid}
    revenue
  end

end
