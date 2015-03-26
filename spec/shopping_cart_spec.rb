require './app/lib/shopping_cart'

describe ShoppingCart do

  let(:item)    { double('item', extract: {name: 'Jeans', price: 1500},
                          price: 1500) }
  let(:voucher) { double('voucher', reduction: 250, redeem!: nil) }

  it 'extracts to a hash with information about its items and total price' do
    shopping_cart = ShoppingCart.new
    shopping_cart.add item

    expect(shopping_cart.extract).to eq(
      { items: [{name: 'Jeans', price: 1500}], total_price: 1500,
        total_after_discount: 1500 }
    )
  end

  it 'calculates a discounted total when a voucher has been added' do
    shopping_cart = ShoppingCart.new
    shopping_cart.add item
    shopping_cart.add_voucher voucher

    expect(shopping_cart.total_after_discount).to eq(item.price - voucher.reduction)
  end

end

