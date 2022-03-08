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
end
