require './lib/attendee'
require 'rspec'
require "pry"

describe Attendee do
  before (:each) do
    @attendee = Attendee.new({name: "Megan", budget: "$50"})
  end

  it "exists and has attributes" do
    expect(@attendee).to be_a(Attendee)
    expect(@attendee.name).to eq("Megan")
    expect(@attendee.budget).to eq(50)
  end
end
