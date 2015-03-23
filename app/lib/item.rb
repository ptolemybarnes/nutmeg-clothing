class Item
  attr_reader :name, :pid

  def initialize options = {}
    @name = options[:name]
    @pid  = generate_product_id
  end

  def extract
    {name: name, pid: pid}
  end

  def generate_product_id
    (('A'..'Z').to_a.sample(2) + (1..9).to_a.sample(3)).join 
  end
end

