class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end


  def add_bid(name, bid)
    @bids[name] = bid
    # require "pry"; binding.pry
  end

  def current_highest_bid
      @bids.values.max_by do |value|
        value
      end
    end

end
