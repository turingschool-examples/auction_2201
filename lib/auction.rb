require 'pry'
require 'date'
class Auction
  attr_reader :items, :date
  def initialize
    @items = []
    @date = Date.today.to_s.gsub("-", "/")
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map{|item| item.name}
  end

  def unpopular_items
    @items.find_all{|item| item.bids.length < 1 }
  end

  def potential_revenue
    high_bids = []
    @items.each {|item| high_bids << item.current_high_bid}
    high_bids.reject! {|bid| bid.nil?}
    high_bids.sum
  end

  def bidders
    bidders = []
    @items.each {|item|
      item.bids.each{|bidder, bid|
        bidders << bidder if bid == item.current_high_bid
      }
    }
    bidders.map{|bidder| bidder.name}
  end

  def bidder_info
    bidders = Hash.new(0)
    @items.each{ |item|
    item.bids.each{|bidder, bid| bidders[bidder] = Hash.new(0)}}
    bidders.each {|bidder, hash| hash[:budget] = bidder.budget}
    bidders.each {|bidder, hash| hash[:items] = @items.find_all{|item|
      item.bids.keys.include?(bidder)
      }
    }
    bidders
  end

  def close_auction
    items_sold = sell_items
    # I was planning to use some helper methods to determine which attendee
    # could buy what based on their budget and bids, but ran out of time
    # at this point and decided to turn in what I had.
  end

  def sell_items
    items_sold = Hash.new(0)
    @items.each do |item|
      items_sold[item] = 'Not Sold' if item.bids.empty?
      item.bids.map do |bidder, bid|
        items_sold[item] = bidder if bid == item.current_high_bid
      end
    end
    items_sold
  end
end
