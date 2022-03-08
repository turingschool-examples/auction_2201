require 'date'
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
    @items.find_all{|item| item.bids =={}}
  end

  def potential_revenue
    valid_high_bids = @items.map{|item| item.current_high_bid}
    potential_revenue = 0
    valid_high_bids.map{|bid| potential_revenue += bid if bid != nil }
    potential_revenue
  end

  def bidders
    bidding_attendees = @items.map {|item| item.bids.keys}.flatten.uniq
    bidding_attendees.map{|bidder| bidder.name}
  end

  def bidder_info
    bidder_info = {}
    items_with_bids = @items.find_all{|item| item.bids != {}}
    items_with_bids.each { |item|
      item.bids.keys.each { |attendee, bid|
        bidder_info[attendee] = {budget: attendee.budget, items: []} if !bidder_info.key?(attendee)
        bidder_info[attendee][:items] << item
                          }
                        }
    bidder_info
  end

  def date
     [Date.today.strftime('%d/%m/%y')[0..-3], Date.today.year.to_s].join
  end


  def close_auction
    items_sold = {}
    bidder_info.each { |attendee, info|
        bidding_items = info[:items]
        until bidding_items ==[] do
            most_expensive_item = bidding_items.max_by {|item| item.current_high_bid}
            if most_expensive_item.bids[attendee] == most_expensive_item.current_high_bid && attendee.budget >= most_expensive_item.current_high_bid
              items_sold[most_expensive_item] = attendee
              attendee.budget -= most_expensive_item.current_high_bid
              break
            else
              bidding_items.delete(most_expensive_item)

              most_expensive_item.bids.delete(attendee)
            end
 
        end
                    }
    @items.each {|item| items_sold[item] = "Not sold" if !items_sold.keys.include?(item)}
    items_sold
    # require "pry"; binding.pry
    end

  end
