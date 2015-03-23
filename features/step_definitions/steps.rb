Given(/^I am on the homepage$/) do
end

Given(/^I (?:have added|add) an item to the shopping cart$/) do
  @item = stock_item 
  shopping_cart.add @item
end

Given(/^I then remove it from the shopping cart$/) do
  shopping_cart.remove @item  
end

Then(/^my shopping cart should be empty$/) do
  expect(shopping_cart).to be_empty 
end

Then(/^the shopping cart should have an item in it$/) do
  expect(shopping_cart).not_to be_empty
end
