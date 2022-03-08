require './lib/item'
require './lib/attendee'

RSpec.describe "Iteration1" do

  it "Item has attributes" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end

  it "Attendee has attributes" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
  end
end