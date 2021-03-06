class Item
  attr_reader :name, :pid, :price, :quantity, :category

  def initialize name: nil, price: nil, quantity: 1, category: nil
    @name     = name
    @price    = price 
    @quantity = quantity 
    @category = category 
    @pid  = generate_product_id
    add_to_items_list self
  end

  def extract
    { name: name, pid: pid, price: price, quantity: quantity, category: category}
  end

  def generate_product_id
    (('A'..'Z').to_a.sample(2) + (1..9).to_a.sample(3)).join 
  end

  def self.find_by(criteria = {})
    criterion = criteria.keys.sample
    self.items_list.find {|item| item.send(criterion) === criteria[criterion] }
  end
  
  def self.items_list
    @@items_list ||= []
  end

  def in_stock?
    quantity > 0
  end

  def footwear?
    category == 'footwear'
  end
 
  private 

  def add_to_items_list item
    self.class.items_list << item
  end

end

