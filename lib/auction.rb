require "./item"
require "./attendee"

class Auction
  attr_reader :items
  def initialize
    @items = []
  end
end
