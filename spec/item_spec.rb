require 'rspec'
require './lib/item'

RSpec.describe Item do
  it "exists" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_a(Item)
  end

  it "has a name" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end 
end
