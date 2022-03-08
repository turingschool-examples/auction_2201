require './lib/attendee'

RSpec.describe Attendee do
  before (:each) do
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Charlie', budget: '$100'})
  end

  it 'has a name' do
    expect(@attendee1.name).to eq("Megan")
    expect(@attendee2.name).to eq("Charlie")
  end

  it 'has a budget' do
    expect(@attendee1.budget).to eq("$50")
    expect(@attendee2.budget).to eq("$100")
  end
end
