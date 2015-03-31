require './app/lib/item'
require 'byebug'

describe Item do

  it 'allows objects of the class Item to be retrieved with their pid' do
    item_to_find = Item.new
    5.times { Item.new }

    expect(Item.find_by(pid: item_to_find.pid)).to eq item_to_find
  end

  it 'knows it its in stock' do
    out_of_stock_item = Item.new(quantity: 0)

    expect(out_of_stock_item.in_stock?).to be false
  end

  it 'knows if its footwear' do
    item = Item.new(name: 'Converse', category: 'footwear', quantity: 3)

    expect(item.footwear?).to eq true
  end
end

