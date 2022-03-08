require './lib/item'
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
    @items.map {|item| item.name}
  end

  def unpopular_items
    @items.find_all {|item| item.bids.empty?}
  end

  def potential_revenue
    @items.map {|item| item.current_high_bid}.compact.sum
  end

  def bidders
    @items.flat_map do |item|
      item.bids.map {|attendee, bid| attendee}
    end.uniq
  end

  def bidder_info
    bidder_info_hash = {}
    bidders.each do |bidder|
      bidder_info_hash[bidder] ||= {budget: 0, items: []}
      bidder_info_hash[bidder][:budget] = bidder.budget
      bidder_info_hash[bidder][:items] = @items.find_all {|item| item.bids.keys.include?(bidder)}
    end
    bidder_info_hash
  end

end
