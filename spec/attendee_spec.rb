require 'pry'
require './lib/'

RSpec.describe  do
  context "Iteration 1" do
    before(:each) do
      @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    end

    it 'exists ' do
      expect(@attendee).to be_a(Attendee)
    end

  end