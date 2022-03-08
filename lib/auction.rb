require 'date'
class Auction
  attr_reader :items
  def initialize
    @items = []
    @date = Date.today
  end

  def date
    @date.to_s
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

  def top_bids
    @items.map {|item| item.current_high_bid}.compact
  end

  def potential_revenue
    top_bids.sum
  end

  def bidders
    @items.map do |item|
      item.bids.map {|attendee, bid| attendee.name}
    end.flatten
  end

  def bidder_info
    info = Hash.new
    @items.each do |item|
      item.bids.each {|attendee, bid| info[attendee] = {} }
    end
    info.each do |attendee, current_bids|
      current_bids[:budget] = attendee.budget
      current_bids[:items] = @items.find_all {|item| item.bids.key?(attendee)}
    end
    info
  end

  def close_auction
    auction_results = Hash.new
    @items.each do |item|
      auction_results[item] = 'Not Sold'
    end
  end
end
