require 'pry'
require './lib/item'
require './lib/attendee'

class Auction
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map {|item| item.name}
  end

  def unpopular_items
    @items.find_all {|item| item.bids.empty?}
  end

  def potential_revenue
    all_bids = @items.map {|item| item.current_high_bid}
    all_bids.delete(nil)
    all_bids.sum
  end

end
