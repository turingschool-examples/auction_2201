require './lib/attendee'
require 'pry'
require 'rspec'

RSpec.describe Item do
  before :each do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'exists' do
    expect(@attendee).to be_a(Attendee)
  end

  it 'has attributes' do
    expect(@item1.name).to eq('Megan')
    expect(@item1.budget).to eq(50)
  end
end
