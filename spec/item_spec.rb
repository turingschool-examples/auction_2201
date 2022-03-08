require 'pry'
require './lib/item'

RSpec.describe Item do
  context 'Iteration 1' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
    end

    it 'exists' do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end

    it 'can tell the name of the Item' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item2.name).to eq('Bamboo Picture Frame')
    end
  end
end
