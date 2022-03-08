require './lib/item.rb'
require './lib/auction.rb'
require './lib/attendee.rb'

RSpec.describe Attendee do
  before :each do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'exists' do
    expect(@attendee).to be_a(Attendee)
  end

  it 'has attributes' do
      expect(@attendee.name).to eq('Megan')
  expect(@attendee.budget).to eq(50)
  end

end

context 'iteration 2' do
  before :each do
  attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
  attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
end
end
