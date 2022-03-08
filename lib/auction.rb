class Auction
  attr_reader :items

  def initialize()
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |name| name.name }
#    item_names_array = @items.map { |name| name.name }
#    item_names_array
  end

  def unpopular_items
    items.find_all do |item|
      item.bids == {}
    end
#    unpopular = []
#    @items.each do |item|
#      binding.pry
#      if @item.bids is nil
#        unpopular << item
#      end
#    end
#    unpopular
  end
  def potential_revenue
      revenue = items.map do |item|
        item.current_high_bid
      end
      revenue.sum
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

end
