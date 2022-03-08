require "./lib/item"

describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Pggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it "exists and has readable attributes" do
    expect(@item1).to be_a(Item)
    expect(@item1.name).to eq('Chalkware Pggy Bank')
    expect(@item1.bids).to eq({})
    expect(@item2).to be_a(Item)
    expect(@item2.name).to eq('Bamboo Picture Frame')
    expect(@item2.bids).to eq({})
  end
end
