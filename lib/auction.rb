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
end
