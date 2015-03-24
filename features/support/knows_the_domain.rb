module KnowsTheDomain

  def shopping_cart
    @shopping_cart ||= Capybara.app.shopping_cart 
  end

  def grab_stock_item
    stock_items.sample
  end

  def stock_items
    @stock_items ||= Capybara.app.stock_items.dup
  end
  
  def add_to_shopping_cart item
    shopping_cart.add item 
  end

end

