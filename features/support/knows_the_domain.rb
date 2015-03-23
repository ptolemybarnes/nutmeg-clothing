module KnowsTheDomain

  def shopping_cart
    @shopping_cart ||= Capybara.app.shopping_cart 
  end

  def stock_item
    stock_items.pop
  end

  def stock_items
    @stock_items ||= Capybara.app.stock_items.dup
  end

end

World(KnowsTheDomain)

module KnowsTheUserInterface

  def visit_homepage
    visit '/'
  end

  def add_to_shopping_cart item
    find("#{item.pid} .add-to-cart").click
  end

end

World(KnowsTheUserInterface)

