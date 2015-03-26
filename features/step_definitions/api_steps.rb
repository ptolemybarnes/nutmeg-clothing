Given(/^I (?:make|have made) a GET request to "(.*?)"$/) do |address|
  get "#{address}"
  expect_status 200
end

When(/^I make a DELETE request to have that item removed$/) do
  delete "api/shopping_carts/1/stock_items/#{shopping_cart.items.sample.pid}"
  expect_status 200
end

Then(/^the item should have been removed from my shopping cart$/) do
  expect(shopping_cart).to be_empty 
end

Given(/^I have made a GET request for an individual stock item$/) do
  @item = grab_stock_item 
  get "api/stock_items/#{@item.pid}"
  expect_status 200
end

Given(/^I have made a POST request to add an item to my shopping cart$/) do
  @item = grab_stock_item 
  post "api/shopping_carts/1/stock_items/#{@item.pid}"
  expect_status 200
end

Then(/^I should receive its information as a JSON$/) do
  expect_json @item.extract 
end

Then(/^I should receive all stock items as a JSON$/) do
  expect_json_types(:array)
end

Then(/^the item should have been added to my shopping cart$/) do
  expect(shopping_cart.items.map(&:pid)).to include(@item.pid)
end

Then(/^I should get a JSON of the contents of my shopping cart$/) do
  expect_json_keys :items
end

Given(/^I have made a GET request for available vouchers$/) do
  get "api/vouchers"
  expect_status 200
end

Then(/^I should receive voucher information as a JSON$/) do
  expect_json({})
end

Given(/^I have made a POST request to add a voucher to my shopping cart$/) do
  vouchers << (voucher = Voucher.new(id: 1, reduction: 200))
  post "/api/shopping_carts/1/vouchers/#{voucher.id}" 
  expect_status 200
end

Given(/^I have made a POST request to add an invalid voucher to my shopping cart$/) do
  vouchers << (voucher = Voucher.new(id: 2, reduction: 200) { false }) 
  post "/api/shopping_carts/1/vouchers/#{voucher.id}"
end

Then(/^I should get an error status code$/) do
  expect_status 412
end

Then(/^the voucher should not have been added to my shopping cart$/) do
  expect(shopping_cart.vouchers.empty?).to eq true 
end

Then(/^the voucher should have been added to my shopping cart$/) do
  expect(shopping_cart.vouchers).to include(voucher)
end

