require './lib/auction.rb'
require './lib/attendee.rb'

class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def item_names

end
