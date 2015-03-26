@api
Feature: API

  Scenario: Retrieve JSON of Stock Items 
    Given I have made a GET request to "/api/stock_items"
    Then I should receive all stock items as a JSON

  Scenario: Retrieve JSON of an individual Stock Item
    Given I have made a GET request for an individual stock item 
    Then I should receive its information as a JSON

  Scenario: Retrieve JSON of Vouchers
    Given I have made a GET request for available vouchers
    Then I should receive voucher information as a JSON

  Scenario: Request to add item to the shopping cart 
    Given I have made a POST request to add an item to my shopping cart 
    Then the item should have been added to my shopping cart

  Scenario: Request to remove item from the shopping cart
    Given I have added an item to my shopping cart
    When I make a DELETE request to have that item removed 
    Then the item should have been removed from my shopping cart
  
  Scenario: Request to add Voucher to Shopping Cart 
    Given I have made a POST request to add a voucher to my shopping cart
    Then the voucher should have been added to my shopping cart

  Scenario: Request to add an invalid Voucher to Shopping Cart
    Given I have made a POST request to add an invalid voucher to my shopping cart
    Then I should get an error status code
    And the voucher should not have been added to my shopping cart

  Scenario: Retrieve JSON of an individual Shopping Cart 
    Given I have added some items to my shopping cart
    When I make a GET request to "/api/shopping_carts/1"
    Then I should get a JSON of the contents of my shopping cart
