Given(/^I (?:make|have made) a GET request to "(.*?)"$/) do |address|
  get "#{address}"
  expect_status 200
end

When(/^I make a DELETE request to "(.*?)"$/) do |address|
  delete address.sub(':item_pid', shopping_cart.items.sample.pid)
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

Then(/^I should receive its information as a JSON$/) do
  expect_json @item.extract 
end

When(/^I make a PUT request to "(.*?)" specifiying a product$/) do |address|
  @item = grab_stock_item
  put "#{address}", { item_pid: @item.pid }
  expect_status 200
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

