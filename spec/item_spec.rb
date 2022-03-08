require 'pry'
require './lib/item'

RSpec.describe Item do
  context 'Iteration 1' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
    end

    it 'exists ' do
      expect(@item1).to be_an_instance_of(Item)
      expect(@item2).to be_an_instance_of(Item)
    end
  end
  # context "Iteration 2" do
  #   before(:each) do

  #   end

  #   xit ' ' do
  #     expect().to eq()
  #   end

  #   xit ' ' do
  #     expect().to eq()
  #   end

  #   xit ' ' do
  #     expect().to eq()
  #   end
  # end
end
