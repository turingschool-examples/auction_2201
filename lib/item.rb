
class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

end
