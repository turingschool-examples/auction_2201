require './lib/item'
require './lib/attendee'
require 'pry'

RSpec.describe Attendee do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end
  describe '#attendee' do
    it 'exists' do

      expect(@attendee).to be_a(Attendee)
    end

    it 'can read an attendee name' do

      expect(@attendee.name).to eq('Megan')
    end

    it 'can read an attendee budget' do

      expect(@attendee.budget).to eq(50)
    end
  end
end
