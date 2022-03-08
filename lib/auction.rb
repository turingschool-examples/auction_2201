require 'pry'
require 'date'
class Auction
  attr_reader :items, :date
  def initialize
    @items = []
    @date = Date.today
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
end
