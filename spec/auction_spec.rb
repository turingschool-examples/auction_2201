require './lib/auction'
require './lib/attendee'
require './lib/item'
require 'date'

RSpec.describe Auction do

  context "Iteration 1" do

    before :each do
      @auction = Auction.new
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
    end

    it "initializes with an empty items attribute" do
      expect(@auction.items).to eq([])
    end

    it "adds items through an add_item method" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq([@item1, @item2])
    end

    it "returns item names through a method item_names" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end

  end

  context "Iteration 2" do

    before :each do
      @auction = Auction.new
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')

      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
    end

    it "returns unpopular_items, items with no bids" do
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])

      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it "returns potential revenue from all highest bids" do
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end

  context "iteration 3" do

    before :each do
      @auction = Auction.new
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')

      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
    end
    # I'll be honest I don't see why this expects Megan's name first!
    # OH MY GOD the interaction pattern for iteration 3 has her bid come in first.
    it "returns all bidders' names through #bidders method" do
      expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
    end

    it "returns bidder information through #bidder_info" do
      expect(@auction.bidder_info).to eq({
        @attendee1 => {
          :budget => 50,
          :items => [@item1]
        }, @attendee2 => {
          :budget => 75,
          :items => [@item1, @item3]
        }, @attendee3 => {
          :budget => 100,
          :items => [@item4]
        }
        })
    end

    it "has helper method attendees to return all attendee objects who have bid on an item" do
      expect(@auction.attendees).to eq([@attendee1, @attendee2, @attendee3])
    end

  end


  context "Iteration 4" do

    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')

      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

      auction = Auction.new

      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee2, 30)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item5.add_bid(@attendee1, 35)

    end

    xit "returns the date of the auction trought the #date method" do
      expect(@auction.date).to eq("24/02/2020")
      # This is what you get, Joe, for not playing with stubs sooner 🤷‍♂️
    end

    xit "closes the auction and returns a hash of item keys and winning attendee values, or 'not sold' if not sold" do
      #Joe I hate to say you aren't gonna crack this with 5 mninutes left. Just make sure your tests are set up right!
      expect(@auction.close_auction).to eq({
        @item1 => @attendee2, #seemingly because attendee1 is overbudget?
        @item2 => "Not Sold",
        @item3 => @attendee2,
        @item4 => @attendee3,
        @item5 => @attendee1
        })
    end

  end

end
