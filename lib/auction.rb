require './lib/attendee'
require 'date'

class Auction
  attr_reader :items

  def initialize
    @items = []
    @auction_date = Date.today
    require "pry"; binding.pry
  end

  def add_item(item)
    @items << item
  end

  def date
    @auction_date.to_s.gsub!(/-/, "/")
  end


  def item_names
    @items.map {|item| item.name}
  end

  def unpopular_items
    @items.select {|item| item.bids == {}}
  end

  def potential_revenue
    revenue = 0
    @items.each {|item| revenue += item.current_high_bid}
    revenue
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.keys.each {|attendee| bidders << attendee.name}
    end
    bidders.uniq
  end

  def bidder_info
    info = {}
    @items.each do |item|
      item.bids.keys.each do |attendee|
        if !info.keys.include?(attendee)
          info[attendee] = {:budget => attendee.budget, :items => []}
        end
        info[attendee][:items] << item
      end
    end
    info
  end

end
