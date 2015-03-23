Feature: Shopping Cart

  Scenario: Adding an Item to the Shopping Cart
    Given I am on the homepage
    And I add an item to the shopping cart
    Then an item should have been added to the shopping cart
