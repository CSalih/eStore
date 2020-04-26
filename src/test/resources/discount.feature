Feature: Will able to test admin discount functions.

  Scenario: Add discount to Product
    Given logged in as "admin"
    And in "editDiscount" page
    When new discount added
    Then discount is saved

  Scenario: If a Product has already 3 discounts, then no more discounts can be added.
    Given logged in as "admin"
    And already assigned 3 discounts to product
    When new discount added
    Then a error message pops up

  Scenario: Customer see's discount on a product page
    Given logged in as "customer"
    When in "product" page
    Then discount is displayed

  Scenario: Discount price and saved money displayed in shopping cart
    Given logged in as "customer"
    And product with discount added to shopping cart
    When in "shopping cart" page
    Then discount price and saved money displayed
