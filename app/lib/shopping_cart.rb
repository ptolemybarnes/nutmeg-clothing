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
    voucher.redeem!
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
      items: items.map(&:extract), total_price: total, 
      total_after_discount: total_after_discount
    }
  end

  def total
    (items.map(&:price).inject(:+) || 0 )
  end

  def total_after_discount
    total - ( vouchers.map(&:reduction).inject(:+) || 0 )
  end

end

