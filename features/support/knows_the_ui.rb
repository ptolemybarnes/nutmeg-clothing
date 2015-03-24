module KnowsTheUserInterface

  def visit_homepage
    visit '/'
  end

  def shopping_cart_ui
    @shopping_cart_ui ||= ShoppingCartUI.new(page)
  end
  
  def click_and_add_item_to_shopping_cart
    item = grab_stock_item 
    find("##{item.pid} > img.shopping-cart").click
  end

  class ShoppingCartUI
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def empty?
      page.find('.shopping-cart-container').all('*').empty?
    end

  end

end


