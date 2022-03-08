require 'pry'
require './lib/item'
require './lib/attendee'

class Auction
  attr_reader :items
  
  def initialize(items = [])
    @items = items
  end
end
