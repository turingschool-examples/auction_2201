class Auction

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item (item_obj)
    @items << item_obj
  end

  def item_names
    @items.map {|item| item.name}
  end

  def unpopular_items
    all_items = @items
    unpopular = all_items.keep_if {|item| item.bids == {}}
  end


end
