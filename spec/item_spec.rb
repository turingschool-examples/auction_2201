require 'rspec'
require './lib/item'

describe Item do
  before(:each) do
    @item = Item.new('Chalkware Piggy Bank')
  end

  it 'exists' do
    expect(@item).to be_an_instance_of(Item)
  end

  it 'has a name' do
    expect(@item.name).to eq("Chalkware Piggy Bank")
  end
end
