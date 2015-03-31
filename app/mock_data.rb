module MockData

  def self.vouchers
    [
      Voucher.new(reduction: 500, description: "£5.00 reduction on any order!"),
      Voucher.new(reduction: 1000, description: "£10.00 reduction on orders totalling over £50.00" ) { |total, items| total > 5000 },
      Voucher.new(reduction: 1500, description: "£15.00 off footwear") do |total, items| 
      total > 7500 && items.any? { |item| item.footwear? }
    end
    ]
  end

  def self.stock_items
    [
      Item.new(name: 'Almond Toe Court Shoes, Patent Black', category: "Women's Footwear",
               price: 9900, quantity: 5),
      Item.new(name: 'Suede Shoes, Blue', category: "Women's Footwear", price: 4200, quantity: 4),
      Item.new(name: 'Leather Driver Saddle Loafers', category: "Men's Footwear", price: 3400, quantity: 12),
      Item.new(name: 'Flip Flops, Red', category: "Men's Footwear", price: 1900, quantity: 6),
      Item.new(name: 'Flip Flops, Blue', category: "Men's Footwear", price: 1900, quantity: 0),
      Item.new(name: 'Gold Button Cardigan, Black', category: "Women's Casualwear", price: 16700, quantity: 6),
      Item.new(name: 'Cotton Shorts, Medium Red', category: "Women’s Casualwear", price: 3000, quantity: 5),
      Item.new(name: "Fine Stripe Short Sleeve￼Shirt, Grey", category: "Men’s Casualwear", price: 4999, quantity: 9),
      Item.new(name: "Fine Stripe Short Sleeve Shirt, Green", category: "Men’s Casualwear", price: 3999, quantity: 3),
      Item.new(name: "Sharkskin Waistcoat, Charcoal", category: "Men's Formalwear", price: 7500, quantity: 2),
      Item.new(name: "Lightweight Patch Pocket Blazer, Deer", category: "Men’s Formalwear", price: 17500, quantity: 1),
      Item.new(name: "Bird Print Dress, Black", category: "Women’s Formalwear", price: 27000, quantity: 10),
      Item.new(name: "Mid Twist Cut-Out Dress, Pink", category: "Women's Formalwear", price: 54000, quantity: 5)
    ]

  end


end
