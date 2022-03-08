class Auction
  attr_reader :items

  def initialize
    @items = []
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
    @items.find_all { |item| item.bids.empty? }
  end

  def potential_revenue
    money = 0
    @items.each do |item|
      money += item.current_high_bid if !item.bids.empty?
    end
    money
  end

  def bidders
    names = []
    @items.each do |item|
      item.bids.each do |attendee, bid|
        names << attendee.name
      end
    end
    names.uniq
  end

  def bidder_info
    info = Hash.new
    @items.each do |item|
      item.bids.each do |attendee, bid|
        info[attendee] = {:budget => 0, :items => []} if !info.has_key?(attendee)
        info[attendee][:budget] += attendee.budget if info[attendee][:budget] == 0
        info[attendee][:items] << item
      end
    end
    info
    # require "pry"; binding.pry
  end
end