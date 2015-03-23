Around do |scenario, block|
  Capybara.app.shopping_cart = ShoppingCart.new
  block.call
  Capybara.app.shopping_cart = ShoppingCart.new
end
