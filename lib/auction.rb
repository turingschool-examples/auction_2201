require 'pry'
require './lib/auction'

class Auction
  attr_reader :items

  def initialize
    @items = Array.new
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
    @items.map do |item|
      item.current_high_bid
    end.compact.sum
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.keys.each do |attendee|
        bidders << attendee.name
      end
    end
    bidders.uniq
  end

  def close_bidding
    @items.each do |item|
      item.bids.freeze
    end
  end

  def all_attendees #makes a hash of all the bidders as key and an empty hash as a value
    bidders = {}
    @items.each do |item|
      item.bids.keys.each do |attendee|
        bidders[attendee] = {:budget => attendee.budget, :item => []}
      end
    end
    bidders
  end

  def bidder_info
    attendees = all_attendees
    @items.each do |item|
      item.bids.each do |key1, value1|
        attendees.each do |key2, value2|
          if key2 == key1
            attendees[key2][:item] << item
          end
        end
      end
    end
    attendees
  end

end
