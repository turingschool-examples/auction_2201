require './lib/item'

RSpec.describe 'Item' do
  describe 'Iteration 1' do
    item1 = Item.new('Chalkware Piggy Bank')

    it 'Has a readable name attribute' do
      expect(item1.name).to eq 'Chalkware Piggy Bank'
    end

    item2 = Item.new('Bamboo Picture Frame')

    
  end

end