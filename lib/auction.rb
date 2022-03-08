require_relative 'item'
require_relative 'attendee'
require 'date'
class Auction

  attr_reader :items

  def initialize
    @items = []
  end

  def date
    Date.today.strftime("%d/%m/%Y")
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

  def bidder_info
    bidder_info_hash = {}
    @items.map{|item| item.bids.keys}.flatten.uniq.each do |attendee|
      bidder_info_hash[attendee] = {}
    end
    bidder_info_helper(bidder_info_hash)
  end

  def bidder_info_helper(bidder_info_hash)
    bidder_info_hash.each do |bidder, info|
      info[:budget] = bidder.budget.tr('^0-9','').to_i
      info[:items] = @items.find_all{|item| item.bids.keys.include?(bidder)}
    end
  end
end
