require './lib/item'
require 'pry'

class Auction

  attr_reader :items

  def initialize
    @items = []
    @bids = {}
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map {|item| item.name}
  end

end
