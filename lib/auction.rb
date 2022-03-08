class Auction

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.map do |item|
      if item.bids.empty?
        item
      end
    end.compact
  end

  def potential_revenue
    array_sum = []
    @items.each do |item|
      array_sum << item.current_high_bid
    end
    array_sum.compact.sum
  end

  def bidders
    @items.map do |item|
      if !item.bids.empty?
        item.bidder_names
      end
    end.flatten.compact.uniq
    # require 'prsy'; binding.pry
  end

  def bidder_info
    # info_hash = Hash.new(0)
    # @items.each do |item|
    #  item.bids.each do |attendee, bid|
    #    info_hash[attendee] = {:budget => attendee.budget, :items => !item.bidder_names.empty? ? item : nil}
    #  end
    # end
    # info_hash
    info_hash = Hash.new(0)
    @items.each do |item|
     item.bids.each do |attendee, bid|
       info_hash[attendee] = {:budget => attendee.budget, :items => []}
     end
    end
    @items.each do |item|
      item.bids.each do |attendee, bid|
        !item.bidder_names.empty? ? info_hash[attendee][:items] << item : nil
      end
    end
    info_hash
    # require 'pry'; binding.pry
  end

end
