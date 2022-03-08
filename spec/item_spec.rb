require './lib/item'

RSpec.describe do
  it "exist" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_an_instance_of(Item)
  end

  it "has an attribute" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq("Chalkware Piggy Bank")
  end
end
