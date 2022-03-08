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

  def potential_revenue
    all_highest_bids = []
    @items.each do |item|
      all_highest_bids << item.current_high_bid
    end
    all_highest_bids.compact.sum
  end

end
