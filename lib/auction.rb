require './item.rb'
require './attendee.rb'

class Auction
  attr_reader :items, :item_names

  def initialize(items = [])
    @items = items
  end

  def add_items(item)
    @items << item
  end

  def item_names
    @items.map {|item| item.name}
  end




end
