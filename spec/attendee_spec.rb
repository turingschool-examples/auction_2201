require "./lib/item"
require "./lib/attendee"

describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it "exists and has readable attributes" do
    expect(@attendee).to be_a(Attendee)
    expect(@attendee.name).to eq("Megan")
    expect(@attendee.budget).to eq(50)
  end
end
