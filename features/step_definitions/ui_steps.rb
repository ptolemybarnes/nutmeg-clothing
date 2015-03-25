World(KnowsTheUserInterface)

Given(/^I am on the homepage$/) do
  visit_homepage
end

Given(/^I click to add an item to the shopping cart$/) do
  sleep(1)
  shopping_cart_ui.add(grab_stock_item) 
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

