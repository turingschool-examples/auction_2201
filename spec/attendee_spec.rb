require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe do

  it "exist" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee).to be_an_instance_of(Attendee)
  end

  it "has attributes"do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee.name).to eq("Megan")
  end


end
