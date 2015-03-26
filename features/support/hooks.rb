Around do |scenario, block|
  Capybara.app.shopping_cart = ShoppingCart.new
  Capybara.app.vouchers.clear
  block.call
  Capybara.app.shopping_cart = ShoppingCart.new
  Capybara.app.vouchers.clear
end
