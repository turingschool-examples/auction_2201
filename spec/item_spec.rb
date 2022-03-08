require "rspec"
require './lib/item'
require './lib/auction'
require './lib/attendee'
RSpec.describe Item do
  before :each do
  @item1 = Item.new('Chalkware Piggy Bank')
  @item2 = Item.new('Bamboo Picture Frame')
  end 
  it "exists" do
    expect(@item1).to be_a(Item)
    expect(@item1.name).to eq("Chalkware Piggy Bank")
  end

end
