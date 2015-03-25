class ShoppingCart
  attr_reader :items, :vouchers

  def initialize
    @items    = []
    @vouchers = []
  end

  def add item
    items << item
  end

  def add_voucher voucher
    vouchers << voucher
  end

  def remove item
    items.delete item
  end

  def empty?
    items.empty?
  end

  def extract
    {
      items: items.map(&:extract), total_price: total_of_items, 
      total_after_discount: total_after_discount
    }
  end

  def total_of_items
    items.map(&:price).inject(:+)
  end

  def total_after_discount
    total_of_items - ( vouchers.map(&:reduction).inject(:+) || 0 )
  end

end

