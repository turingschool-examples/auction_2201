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
    @items.map { |item| item.current_high_bid }.compact.sum
  end

  def bidders
    the_bidders = []
    @items.map do |item|
      item.bids.each do |attendee, amount|
        the_bidders << attendee
      end
    end
    the_bidders.uniq.map { |bidder| bidder.name }
  end

  def bidders_as_objects
    bidder_objects = []
    @items.map do |item|
      item.bids.each do |attendee, amount|
        bidder_objects << attendee
      end
    end
    bidder_objects.uniq
  end

  def bidder_info
    info = {}
    bidders_as_objects.map { |bidder| info[bidder] = {budget: bidder.budget, items: []} }
    info.map do |attendee, sub_hash|
      @items.map do |item|
        if item.bids.keys.include?(attendee)
          sub_hash[:items] << item
        end
      end
    end
    info
  end

end
