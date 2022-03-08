require './lib/item'

RSpec.describe Item do

  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
  end


  it 'exists' do
    expect(@item1).to be_a(Item)
  end

  it 'has a name' do
    expect(@item1.name).to eq("Chalkware Piggy Bank")
  end



end
