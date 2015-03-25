require './app/lib/shopping_cart'

describe ShoppingCart do

  let(:item) { double('shopping_cart', extract: {name: 'Jeans', price: 15.0},
                      price: 15.0) }

  it 'extracts to a hash with information about its items and total price' do
    shopping_cart = ShoppingCart.new
    shopping_cart.add item

    expect(shopping_cart.extract).to eq({items: [{name: 'Jeans', price: 15.0}],
                                         total_price: 15.0})
  end

end

