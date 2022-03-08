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
end
