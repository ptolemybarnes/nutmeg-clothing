Given(/^I am on the homepage$/) do
end

Given(/^I add an item to the shopping cart$/) do
  shopping_cart.add new_item
end

Then(/^an item should have been added to the shopping cart$/) do
  expect(shopping_cart).not_to be_empty
end
