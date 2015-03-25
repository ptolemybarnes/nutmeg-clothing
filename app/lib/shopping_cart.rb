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
    { items: items.map(&:extract), total_price: items.map(&:price).inject(:+) }
  end
end

