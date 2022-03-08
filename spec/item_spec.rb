require './lib/item'

RSpec.describe Item do

  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it "initializes with a name and empty bids attribute" do
    expect(@item1.name).to eq("Chalkware Piggy Bank")
  end
  
end
