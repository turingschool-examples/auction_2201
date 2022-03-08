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

  def bidders
    @items.map do |item|
      item.bids.map {|bidder, amount| bidder.name}
    end.flatten.uniq
  end

  def bidder_info
    full_info = {}
    bidders = @items.map do |item|
      item.bids.map {|bidder, amount| bidder}
    end.flatten.uniq

    bidders.each {|bidder| full_info[bidder] = {budget: bidder.budget}
    full_info[bidder][:items] = @items.find_all { |item| item.bids.keys.include?(bidder)}}

    full_info
  end

end
