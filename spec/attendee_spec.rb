require './lib/attendee'


RSpec.describe Attendee do

  attendee = Attendee.new({name: 'Megan', budget: '$50'})

  it 'exists' do
    expect(attendee).to be_a(Attendee)
  end

  it 'has a name and a budget' do
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
  end

end
