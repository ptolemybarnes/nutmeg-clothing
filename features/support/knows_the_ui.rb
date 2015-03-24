module KnowsTheUserInterface

  def visit_homepage
    visit '/'
  end
  
  def click_and_add_item_to_shopping_cart
    item = grab_stock_item 
    find("##{item.pid} > img.shopping-cart").click
  end

end


