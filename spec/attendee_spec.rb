require 'rspec'
require './lib/attendee'

RSpec.describe Attendee do
  it "exists" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee).to be_a(Attendee)
  end
end
