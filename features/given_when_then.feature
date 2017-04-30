Feature:
  I want to show examples of given when and thens

  Scenario: Admin Order Section
    Given I am an admin
    When I go to "/admin/orders"
    Then I should see a table of orders

  Scenario: Discover Contextual Search
    # Authentication block that will se the headers
    Given I have the proper authentication
    When I set get parameters "per_page" with value "2"
    When I set get parameters "page" with value "1"
    When I set get parameters "query" with value "floral tapestries"
    Then I should see response with results
    Then I should see results of type "products"
    Then I should see component "product_types" and child component "tapestries" as selected
    Then I should not see component "product_types" and child component "prints" as selected
    Then I should see component "search_types" and child component "product" as selected
    Then I should not see component "search_type" with child component "user" as selected

  Scenario: Discover Contextual Search User
  # Authentication block that will se the headers
    Given I have the proper authentication
    When I set get parameters "per_page" with value "2"
    When I set get parameters "page" with value "1"
    When I set get parameters "query" with value "Matt Li User"
    Then I should see results of type "users"
    Then I should not see component "product_types"
    Then I should see component "search_type" with child component "user" as selected
    Then I should not see component "search_types" and child component "product" as selected


