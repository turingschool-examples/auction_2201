class Auction

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item (item_obj)
    @items << item_obj
  end

  def item_names
    @items.map {|item| item.name}
  end

  def unpopular_items
    all_items = @items
    unpopular = all_items.keep_if {|item| item.bids == {}}
  end

  def potential_revenue
    potential = @items.map {|item| item.current_high_bid}
    potential.sum
  end

  def bidders
    names = []
    @items.each do |item|
      item.bids.each_key { |attendee| names << attendee.name unless names.include? attendee.name}
    end
    names
  end

  def attendees
    in_attendance = []
    @items.each { |item| in_attendance << item.bids.keys }
    in_attendance.flatten.uniq
  end

  def bidder_info
    output = {}
    attendees.each do |attendee|
      output[attendee] = {budget: attendee.budget, items:[]}
      @items.each { |item| output[attendee][:items] << item if item.bids.keys.include?(attendee)}
    end
    output
  end
end
