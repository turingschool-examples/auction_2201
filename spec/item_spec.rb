require './lib/item'
require 'pry'
require 'rspec'

RSpec.describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it 'exists' do
    expect(@item1).to be_a(Item)
  end
end
