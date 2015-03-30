require 'byebug'
module KnowsTheUserInterface

  def visit_homepage
    visit '/'
  end

  def refresh_page
    visit_homepage
  end

  def shopping_cart_ui
    @shopping_cart_ui ||= ShoppingCartUI.new(page)
  end

  def vouchers_ui
    @vouchers_ui ||= VouchersUI.new(page)
  end

  class VouchersUI
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def any_available?
      page.first('li.voucher button.add-voucher') ? true : false
    end
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


