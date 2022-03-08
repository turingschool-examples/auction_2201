require 'rspec'
require './lib/attendee'

describe Attendee do
  before :each do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  context 'initialization' do
    it 'exists' do
      expect(@attendee).to be_a(Attendee)
    end

    it 'has a name' do
      expect(@attendee.name).to eq('Megan')
    end

    it 'has a budget' do
      expect(@attendee.budget).to eq(50)
    end
  end
end
