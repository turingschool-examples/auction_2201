require 'pry'

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_names_array = []
    @items.each do |item|
      item_names_array << item.name
    end
    item_names_array
  end

end
