require 'pry'

class Item
  attr_reader :bids, :name

  def initialize(name)
    @bids = {}
    @name = name
  end

end
