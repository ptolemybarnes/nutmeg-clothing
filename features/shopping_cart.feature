@javascript
Feature: Shopping Cart

  Scenario: Adding an Item to the Shopping Cart
    Given I am on the homepage
    And I click to add an item to the shopping cart
    Then the shopping cart should have an item in it 

  Scenario: Viewing the Shopping Cart
    Given I have added an item to the shopping cart
    And I am on the homepage
    Then I should see the item in my shopping cart

  Scenario: Removing a product from the Shopping Cart
    Given I have added an item to the shopping cart
    And I am on the homepage
    And I then click to remove it from the shopping cart
    Then my shopping cart should be empty

  Scenario: Total Price for products in the Shopping Cart 
    Given I have added some items to my shopping cart 
    And I am on the homepage
    Then I should see a total price in my shopping cart

  Scenario: Adding a Voucher to the Shopping Cart
    Given I have added some items to my shopping cart
    And I am on the homepage
    And I click to add a voucher to my shopping cart
    Then the total price should be discounted
    And the voucher is no longer available 

  Scenario: Adding an Invalid Voucher to the Shopping Cart
    Given I am on the homepage
    And I add an item worth "£10" to the shopping cart
    And I add a voucher applicable only to purchases over £50
    Then I should be alerted that the voucher is invalid

