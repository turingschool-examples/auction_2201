require './lib/attendee'
require 'pry'

RSpec.describe Attendee do

  before(:each) do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  context 'Iteration 1' do
    it 'is initialized with a name' do
      expect(@attendee.name).to eq('Megan')
    end

    it 'is initialized with a budget' do
      expect(@attendee.budget).to eq(50)
    end
  end

  context 'Iteration 4' do
    it 'can update its budget' do
      @attendee.update_budget(20)
      expect(@attendee.budget).to eq(30)
    end
  end
end
