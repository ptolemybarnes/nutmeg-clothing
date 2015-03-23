require './app/lib/item'
require 'byebug'

describe Item do

  it 'extracts public information into a hash' do
    item = Item.new(name: 'Blue Jeans')
    
    expect(item.extract).to eq name: 'Blue Jeans', pid: item.pid
  end

  it 'allows objects of the class Item to be retrieved with their pid' do
    item_to_find = Item.new
    5.times { Item.new }

    expect(Item.find_by(pid: item_to_find.pid)).to eq item_to_find
  end
end

