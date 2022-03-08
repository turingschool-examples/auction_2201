class Auction
  attr_reader :items

  def initialize()
    @items = []
    @date = Date.today
  end

  def add_item(item)
    items << item
  end

  def item_names
    items.map { |item| item.name }
  end
  
  def unpopular_items
    items.find_all { |item| item.bids == {} }
  end

  def popular_items
    items.find_all { |item| item.bids != {} }
  end

  def top_bids
    popular_items.map { |item| item.current_highest_bid }
  end

  def potential_revenue
    top_bids.sum
  end

  def unique_bidders
    items.map { |item| item.bids.keys }.flatten.uniq
  end

  def bidders
    unique_bidders.map { |bidder| bidder.name }
  end

  def date
    @date.strftime("%d/%m/%Y")
  end

end