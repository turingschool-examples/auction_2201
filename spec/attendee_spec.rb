require './lib/attendee'

RSpec.describe Attendee do

  before :each do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'initializes with a readable name' do
    expect(@attendee.name).to eq("Megan")
  end

  it 'returns given string budget as an integer' do
    expect(@attendee.budget).to eq(50)
  end

end
