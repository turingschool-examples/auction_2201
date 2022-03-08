require './lib/item'
require 'date'
require 'pry'

class Auction

  attr_reader :items

  def initialize
    @items = []
    @date = Date.today
  end

  def date
    @date.strftime('%d/%m/%Y')
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
      item.bids.map {|attendee, bid| attendee.name}
    end.uniq
  end

  def bidder_info
    bidder_info_hash = {}
    bidder_objects = @items.flat_map {|item| item.bids.map {|attendee, bid| attendee}}.uniq
    bidder_objects.each do |bidder|
      bidder_info_hash[bidder] ||= {budget: 0, items: []}
      bidder_info_hash[bidder][:budget] = bidder.budget
      bidder_info_hash[bidder][:items] = @items.find_all {|item| item.bids.keys.include?(bidder)}
    end
    bidder_info_hash
  end

  def close_auction
    summary_hash = Hash.new("Not Sold")
    @items.each do |item|
      summary_hash[item] = item.sell if item.sell
    end
  end

end
