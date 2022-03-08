class Item
  attr_reader :bids,
              :name

  def initialize(name)
    @bids = Hash.new(0)
    @name = name
  end
end
