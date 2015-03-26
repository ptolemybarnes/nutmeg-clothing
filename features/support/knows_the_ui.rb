require 'byebug'
module KnowsTheUserInterface

  def visit_homepage
    visit '/'
  end

  def shopping_cart_ui
    @shopping_cart_ui ||= ShoppingCartUI.new(page)
  end
  
  class ShoppingCartUI
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def empty?
      page.find('.shopping-cart-container').all('*').empty?
    end
    
    def add(item)
      page.find("##{item.pid} > img.shopping-cart").click
    end

    def add_voucher(voucher)
      page.within('.vouchers-contents') do
        page.click_button('Add') 
      end
    end

    def remove(item)
      page.find("##{item.pid} > img.remove-from-cart").click
    end

    def total_price
      page.find(".total-price").text
    end
  end
end


