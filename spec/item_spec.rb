require 'rspec'
require './lib/item'

RSpec.describe Item do
  it "exists" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_a(Item)
  end
end
