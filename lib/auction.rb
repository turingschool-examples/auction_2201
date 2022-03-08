# require "./item"
class Auction 
  attr_reader :items 

  def initialize
    @items = []
  end
  def add_item(item)
    @items << item
  end
   
  def item_names
    @items.map {|item| item.name}
  end
  
  def unpopular_items
    @items.find_all {|item| item.bids == {}}
  end
  
  def potential_revenue
    @items.map {|item| item.current_high_bid}.compact.sum
  end
  
  def bidders
    @items.map do |item| 
      item.bids.map {|attendee, bid| attendee.name}
    end 
    .flatten.uniq
  end
  def attendees
    @items.map do |item| 
      item.bids.map {|attendee, bid| attendee}
    end 
    .flatten.uniq
  end 
  
  def items_bid_on(attendee)
    @items.find_all do |item|
      item.bids.each {|bidder, bid|}
      bidder == attendee
      require "pry"; binding.pry
    end 
  end

  def bidder_info
    attendee_hashs = {}
    attendees.each {|attendee| attendee_hashs = Hash.new[attendee]}
    
    require "pry"; binding.pry
      # [:budget => attendee.budget, :items => items_bid_on(attendee)]
  end

end 
