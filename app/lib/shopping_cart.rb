class ShoppingCart
  attr_reader :items

  def initialize
    @items = []
  end

  def add item
    items << item
  end

  def empty?
    items.empty?
  end
end

