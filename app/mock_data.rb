module MockData

  def self.vouchers
    [
    Voucher.new(reduction: 500),
    Voucher.new(reduction: 1000) { |total, items| total > 5000 },
    Voucher.new(reduction: 1500) do |total, items| 
      total > 7500 && items.any? { |item| item.footwear? }
    end
    ]
  end

  def self.stock_items
    Array.new(10) { Item.new(name: "Jeans", category: "Men's Casualwear", price: 1000, quantity: 5) }
  end


end
