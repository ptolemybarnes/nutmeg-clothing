World(KnowsTheDomain)

Given(/^I (?:have added|add) an item to the shopping cart$/) do
  @item = grab_stock_item 
  add_to_shopping_cart @item 
end

Given(/^I have added an item to my shopping cart$/) do
  add_to_shopping_cart(grab_stock_item) 
end

Given(/^I have added some items to my shopping cart$/) do
  2.times { add_to_shopping_cart(grab_stock_item) } 
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
