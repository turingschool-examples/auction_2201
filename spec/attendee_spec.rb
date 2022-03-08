require "./lib/attendee"

RSpec.describe Attendee do
  attendee = Attendee.new({name: "Megan", budget: "$50"})

  it "exists/ has readable attributes" do
    expect(attendee).to be_an_instance_of(Attendee)
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
  end
end
