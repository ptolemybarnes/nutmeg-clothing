@api
Feature: API

  Scenario: Retrieve JSON of Stock Items 
    Given I have made a GET request to "/api/stock_items"
    Then I should receive all stock items as a JSON

  Scenario: Retrieve JSON of individual stock item
    Given I have made a GET request for an individual stock item 
    Then I should receive its information as a JSON

  Scenario: Request to add item to the shopping cart 
    When I make a PUT request to "/api/shopping_cart" specifiying a product
    Then the item should have been added to my shopping cart

  Scenario: Retrieve JSON of shopping cart 
    Given I have added some items to my shopping cart
    When I make a GET request to "/api/shopping_cart"
    Then I should get a JSON of the contents of my shopping cart
