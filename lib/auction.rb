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
end
