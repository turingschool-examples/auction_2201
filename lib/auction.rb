class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map(&:name)
  end

  def unpopular_items
    @items.find_all{|item| item.bids.length < 1 }
  end

  def potential_revenue
    top_bids = []
    @items.each {|item| top_bids << item.current_high_bid}
    top_bids.delete_if {|bid| bid.nil?}
    top_bids.sum
  end
end
