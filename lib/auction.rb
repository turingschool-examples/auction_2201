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

  def unpopular_items
    unpopular = items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
      potential_revenue_array = []
      @items.each do |item|
        potential_revenue_array << item.current_high_bid
      end
      potential_revenue_array.sum
  end

  def bidders
    bidder_names = []
    @item.bids.each do |attendee, bid|
      bidder_names << @item.bids[:attendee.name]
    end
  end

end
