@api
Feature: API

  Scenario: View Stock Items 
    Given I have made a GET request to "/api/stock_items"
    Then I should receive all stock items as a JSON
