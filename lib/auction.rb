class Auction
  attr_reader :items
    def initialize()
      @items = []
    end

  def add_item(item)
    items.push(item)
  end

  def item_names
    items.map{|item| item.name}
  end

  def unpopular_items
    items.find_all {|item| item.bids.length == 0}
  end

  def potential_revenue
    high_bids = items.map {|item| item.current_high_bid}
    high_bids.sum
  end

  def bidders
    bidders = []
    items.each do |item|
      item.bids.each do |bid|
        bidders.push(bid[0].name)
      end
    end
    bidders.uniq
  end

  def bidder_info
    attendees = {}
    items.each do |item|
      item.bids.each do |bid|
        if attendees.include? bid[0]
        else
          attendees[bid[0]] = {:budget => bid[0].budget, :items => []}
        end
      end
    end
    items.each do |item|
      item.bids.each do |bid|
          attendees[bid[0]][:items].push(item)
          binding.pry
      end
    end
    binding.pry
    return attendees
  end
end
