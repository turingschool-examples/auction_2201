require './lib/item.rb'
require './lib/auction.rb'
require './lib/attendee.rb'

RSpec.describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')

    @item2 = Item.new("Bamboo Picture Frame")
  end

  it 'exists' do
    expect(@item1).to be_a(Item)
    expect(@items2).to be_a(Item)
  end


  it 'has attributes' do
    expect(@item1.name).to eq("Chalkware Piggy Bank")
  end
end

 context 'iteration 2' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
    end
  end
