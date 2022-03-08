require './lib/attendee'

RSpec.describe 'Attendee' do
  describe 'Iteration 1' do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})

    it 'has readable attributes' do
      expect(attendee.name).to eq 'Megan'
      expect(attendee.budget).to eq 50
    end
  end
end