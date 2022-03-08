require './lib/item'
require 'pry'

RSpec.describe Item do

  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
  end

  context 'Iteration 1' do
    it 'is initialized with a name' do
      expect(@item1.name).to eq("Chalkware Piggy Bank")
    end
  end 
end
