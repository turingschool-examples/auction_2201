require './lib/attendee'

RSpec.describe Attendee do

  before :each do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'initializes with a readable name and budget' do
    expect(@attendee.name).to eq("Megan")
    expect(@attendee.budget).to eq(50)
  end

end
