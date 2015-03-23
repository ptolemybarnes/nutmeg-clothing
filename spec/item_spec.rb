require './app/lib/item'

describe Item do

  it 'extracts public information into a hash' do
    item = Item.new(name: 'Blue Jeans')
    
    expect(item.extract).to eq name: 'Blue Jeans', pid: item.pid
  end
end

