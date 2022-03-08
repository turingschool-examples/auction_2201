require "./lib/item"
require "./lib/attendee"
require "./lib/auction"
require "pry"

RSpec.describe Auction do
  context "Iteration 1" do
    item1 = Item.new("Chalkware Piggy Bank")
    item2 = Item.new("Bamboo Picture Frame")

    auction = Auction.new

    it "exists/ has readable attributes" do
      expect(auction).to be_an_instance_of(Auction)
      expect(auction.items).to eq([])
    end

    it "adds items" do
      auction.add_item(item1)
      auction.add_item(item2)
      expect(auction.items).to eq([item1, item2])
    end

    it "reads item names" do
      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  context "Iteration 2" do
    item1 = Item.new("Chalkware Piggy Bank")
    item2 = Item.new("Bamboo Picture Frame")
    item3 = Item.new("Homemade Chocolate Chip Cookies")
    item4 = Item.new("2 Days Dogsitting")
    item5 = Item.new("Forever Stamps")

    attendee1 = Attendee.new({name: "Megan", budget: "$50"})
    attendee2 = Attendee.new({name: "Bob", budget: "$75"})
    attendee3 = Attendee.new({name: "Mike", budget: "$100"})

    auction = Auction.new

    it "Item adds bids" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      expect(item1.bids).to eq({})

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.bids).to eq({attendee2 => 20,
                                attendee1 => 22})
    end

    it "Item reads current high bid" do
      expect(item1.current_high_bid).to eq(22)
    end

    it "Auction finds unpopular items" do
      item4.add_bid(attendee3, 50)
      expect(auction.unpopular_items).to eq([item2, item3, item5])
      item3.add_bid(attendee2, 15)
      expect(auction.unpopular_items).to eq([item2, item5])
    end

    it "Auction calculates potential revenue" do
      expect(auction.potential_revenue).to eq(87)
    end
  end

  context "Iteration 3" do
    item1 = Item.new("Chalkware Piggy Bank")
    item2 = Item.new("Bamboo Picture Frame")
    item3 = Item.new("Homemade Chocolate Chip Cookies")
    item4 = Item.new("2 Days Dogsitting")
    item5 = Item.new("Forever Stamps")

    attendee1 = Attendee.new({name: "Megan", budget: "$50"})
    attendee2 = Attendee.new({name: "Bob", budget: "$75"})
    attendee3 = Attendee.new({name: "Mike", budget: "$100"})

    auction = Auction.new

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    item1.add_bid(attendee1, 22)
    item1.add_bid(attendee2, 20)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)
  end
end
