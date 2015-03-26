World(KnowsTheUserInterface)

Given(/^I am on the homepage$/) do
  visit_homepage
end

Given(/^I click to add an item to the shopping cart$/) do
  sleep(1)
  shopping_cart_ui.add(grab_stock_item) 
end

Given(/^I add an item worth "(.*?)" to the shopping cart$/) do |value|
  stock_items << Item.new(name: 'Fur Coat', price: (value * 100).to_i)
end

Given(/^I then click to remove it from the shopping cart$/) do
  shopping_cart_ui.remove(shopping_cart.items.sample)
end

Then(/^I should see the item in my shopping cart$/) do
  expect(shopping_cart_ui.empty?).to eq false
end

Then(/^I should see a total price in my shopping cart$/) do
  shopping_cart_ui.total_price
end

Given(/^I click to add a voucher to my shopping cart$/) do
  voucher = Voucher.new(reduction: 500, id: 2, description: "5 pounds off!")
  vouchers << voucher

  visit_homepage
  shopping_cart_ui.add_voucher voucher
end

Given(/^I add a voucher applicable only to purchases over £(\d+)$/) do |value|
  voucher = Voucher.new(reduction: 1000, id: 3, 
                       description: "10 pounds off purchases over 50" ) do |total|
    total > 5000
  end
    
  vouchers << voucher
  visit_homepage
  shopping_cart_ui.add_voucher voucher
end

Then(/^the total price should be discounted$/) do
  expect(shopping_cart.total_after_discount < shopping_cart.total).to eq true 
end

Then(/^I should be alerted that the voucher is invalid$/) do
  expect(page).to have_content "Invalid Voucher"
end

Then(/^the voucher is no longer available$/) do
  expect(vouchers_ui.any_available?).to eq false
end

