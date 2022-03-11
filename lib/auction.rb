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

  def items_with_sorted_bidder_by_bid
    sorted_list = {}
    @items.each {|item| sorted_list[item] = item.bids.sort_by{|attendee, bid| bid}.reverse
  }
    sorted_list
  end

  def attendees_with_ranked_items
    sorted_list = {}
    bidder_info
    bidder_info.each  {|attendee, info|
          sorted_list[attendee] = {}
          sorted_list[attendee][:ranked_bids] = info[:items].sort_by{|item|
            item.bids[attendee]}.reverse
           if attendee.budget >=sorted_list[attendee][:ranked_bids].map{|item| item.bids[attendee]}.sum
             sorted_list[attendee][:stinky_rich?] = true
           end
                          }

      sorted_list
  end

  def close_auction
    items_sold = {}
    item_list = items_with_sorted_bidder_by_bid
    items_with_sorted_bidder_by_bid.each do |item, ranked_bids|
        if item.bids == {}
          items_sold[item] = "Not sold"
        end
        ranked_bids.each do |bid|
        if item_list[item][0] == bid && attendees_with_ranked_items[bid[0]][:stinky_rich?] == true
                items_sold[item] = bid[0]
                break
        elsif item_list[item][0] == bid && attendees_with_ranked_items[bid[0]][:ranked_bids][0] == item && bid[0].budget >= bid[1]
                items_sold[item] = bid[0]
                break
        else
                attendees_with_ranked_items[bid[0]][:ranked_bids].delete(item)
                item_list[item].delete(bid)
        end
       end
      end
      items_sold
   end

  end
