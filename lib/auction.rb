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
end
