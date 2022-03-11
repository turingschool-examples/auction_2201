require './lib/item'
require './lib/attendee'
require './lib/auction'
require 'date'

context 'iteration_4' do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
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

  describe Auction do
    it 'has a date in dd/mm/yyyy format' do
      expect(@auction.date).to eq "11/03/2022"

    end

    it 'sells item to bidders when close_auction' do
      expect(@auction.close_auction).to eq ({
                                            @item1 => @attendee2,
                                            @item2 => 'Not sold',
                                            @item3 => @attendee2,
                                            @item4 => @attendee3,
                                            @item5 => @attendee1
                                            })
    end
  end


end
