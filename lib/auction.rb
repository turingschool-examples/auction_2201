require_relative 'item'
require_relative 'attendee'
class Auction

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map{|item| item.name}
  end

  def unpopular_items
    @items.find_all{|item| item.bids.length == 0}
  end

  def potential_revenue
    @items.map{|item| item.current_high_bid.to_i}.sum
  end

  def bidders
    @items.map{|item| item.bids.keys}.flatten.uniq.map{|attendee| attendee.name}
  end
end
