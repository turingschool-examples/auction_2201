require './lib/item'

RSpec.describe Item do
  it "has attributes" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end
end