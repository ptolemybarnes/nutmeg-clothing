Feature: Shopping Cart

  Scenario: Adding an Item to the Shopping Cart
    Given I am on the homepage
    And I click to add an item to the shopping cart
    Then the shopping cart should have an item in it 

  Scenario: Removing a product from the Shopping Cart
    Given I have added an item to the shopping cart
    But I then remove it from the shopping cart
    Then my shopping cart should be empty
