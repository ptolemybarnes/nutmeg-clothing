
class Item
end

module KnowsTheDomain

  def shopping_cart
    @shopping_cart ||= Capybara.app.shopping_cart 
  end

  def new_item
    Item.new
  end

end

World(KnowsTheDomain)
