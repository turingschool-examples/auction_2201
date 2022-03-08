require 'item'
require 'attendee'



class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def items_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    unpopular_array = []
    @items.each do |item|
      if !item.bids.empty? == false
        unpopular_array << item
      end
    end
    unpopular_array
  end

end
