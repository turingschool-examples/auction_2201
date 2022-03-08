require 'pry'
class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    names = @items.map { |item| item.name}
  end

  def unpopular_items
    unpopular_items = @items.find_all { |item| item.bids.empty?}
  end

  def potential_revenue
    revenue = 0
    @items.each do |item|
      if item.bids.empty? == false
        revenue += item.current_high_bid
      end
    end
    revenue
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.each do |attendee, bid|
        bidders << attendee.name
      end
    end
    bidders.uniq
  end

  def bidder_info
    bidder_hash = {}
    @items.each do |item|
      if item.bids.empty? == false
        item.bids.each do |attendee, bid|
          if bidder_hash.key?(attendee) == false
            bidder_hash[attendee] = {budget: attendee.budget, items: []}
          end
        end
      end
    end
    bidder_hash.each do |attendee, info|
      @items.each do |item|
        if item.bids.include?(attendee)
          info[:items] << item
        end
      end
    end
    # binding.pry
    return bidder_hash
  end

end
