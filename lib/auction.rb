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
end
