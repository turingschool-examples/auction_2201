require './lib/item'

RSpec.describe 'Item' do
  describe 'Iteration 1' do
    item1 = Item.new('Chalkware Piggy Bank')

    it 'Has a readable name attribute' do
      expect(item1.name).to eq 'Chalkware Piggy Bank'
    end
  end

  describe 'Iteration 2' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookie')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    it 'Has a bids attribute' do
      expect(item1.bids).to eq({})
    end
  end

end