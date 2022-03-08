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
    @items.map do |item|
      if !item.bids.empty? == false
        item
      end
    end.compact
  end

  def potential_revenue
    all_highest_bids = []
    @items.each do |item|
      all_highest_bids << item.current_high_bid
    end
    all_highest_bids.compact.sum
  end

  def bidders
    the_bidders = []
    bidder_names = []
    @items.each do |item|
      item.bids.each do |attendee, amount|
        the_bidders << attendee
      end
    end
    the_bidders.uniq.each do |bidder|
      bidder_names << bidder.name
    end
    bidder_names
  end

  def bidder_info
    hash = {}

    bidders = []
    @items.each do |item|
      item.bids.each do |attendee, amount|
        bidders << attendee
      end
    end
    bidders.each do |bidder|
      hash[bidder] = {budget: bidder.budget, items: []}
    end
    hash.each do |attendee, sub_hash|
      @items.each do |item|
        if item.bids.keys.include?(attendee)
          sub_hash[:items] << item
        end
      end
    end
    hash
  end

end


#items.map { |item| item.bids.keys }.flatten.uniq
# hash.each do |attendee, sub_hash|
#   @items.each do |item|
#     if item.bids.keys.include?(attendee)
#       sub_hash[:items] << item
#     end
#   end
# end
#
# hash
