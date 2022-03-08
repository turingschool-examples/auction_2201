require 'rspec'
require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  before (:each) do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'exists' do
    expect(@attendee).to be_an_instance_of(Attendee)
  end

  it 'has a name' do
    expect(@attendee.name).to eq("Megan")
  end
end
