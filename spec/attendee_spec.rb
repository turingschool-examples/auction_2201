require './lib/item'

RSpec.describe Item do

  before(:each) do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'exists' do
    expect(@attendee).to be_a(Attendee)
  end

end
