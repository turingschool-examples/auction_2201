class Item
  attr_reader :bids, :name

  def initialize(_info)
    @bids = Hash.new(0)
    @name = name
  end
end
