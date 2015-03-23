require 'byebug'
Given(/^I have made a GET request to "(.*?)"$/) do |address|
  get "#{address}"
  expect_status 200
end

Then(/^I should receive all stock items as a JSON$/) do
  expect_json_types([])
end
