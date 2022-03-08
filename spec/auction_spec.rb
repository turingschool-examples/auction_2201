require './lib/item'
require './lib/attendee'
require './lib/auction'
require 'rspec'
require 'pry'

 describe Auction do
    context "the beginning" do
      before (:each) do
       @item1 = Item.new("Chalkware Piggy Bank")
       @item2 = Item.new("Bamboo Picture Frame")
       @attendee = Attendee.new({name: "Megan", budget: "$50"})
       @auction = Auction.new
      end

      it "is classy" do
       expect(@auction).to be_a(Auction)
       expect(@auction.items).to eq([])
      end

      it "can have items" do
       @auction.add_item(@item1)
       @auction.add_item(@item2)
       # binding.pry

       expect(@auction.items).to eq([@item1, @item2])
       expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
      end
    end

    context "getting spicy" do
      before (:each) do
        @item1 = Item.new("Chalkware Piggy Bank")
        @item2 = Item.new("Bamboo Picture Frame")
        @item3 = Item.new("Homemade Chocolate Chip Cookies")
        @item4 = Item.new("2 Days Dogsitting")
        @item5 = Item.new ("Forever Stamps")
        @attendee1 = Attendee.new({name: "Megan", budget: "$50"})
        @attendee2 = Attendee.new({name: "Bob", budget: "$75"})
        @attendee3 = Attendee.new({name: "Mike", budget: "$100"})
        @auction = Auction.new
        @auction.add_item(item1)
        @auction.add_item(item2)
        @auction.add_item(item3)
        @auction.add_item(item4)
        @auction.add_item(item5)
      end

      it "has bids" do
        expect(@item1.bids).to eq({})
      end



    end
 end
