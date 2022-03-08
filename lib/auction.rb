require "./item"
require "./attendee"

class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item| item.name
    end
  end

  def total_bids(item)
      total_bids = item.bids.values.sum.to_i
  end


end
