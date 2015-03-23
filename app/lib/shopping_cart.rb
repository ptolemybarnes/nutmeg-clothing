class ShoppingCart
  attr_reader :items

  def initialize
    @items = []
  end

  def add item
    items << item
  end

  def remove item
    items.delete item
  end

  def empty?
    items.empty?
  end
end

