Feature:
  I want to show examples of cleaning up scenarios

  Scenario: Discover Contextual Search
    # Authentication block that will se the headers
    Given I have the proper authentication
    When I set get parameters "per_page" with value "2"
    And I set get parameters "page" with value "1"
    And I set get parameters "query" with value "floral tapestries"
    Then I should see response with results
    And I should see results of type "products"
    And I should see component "product_types" and child component "tapestries" as selected
    But I should not see component "product_types" and child component "prints" as selected
    And I should see component "search_types" and child component "product" as selected
    But I should not see component "search_type" with child component "user" as selected

  Scenario: Discover Contextual Search User
  # Authentication block that will se the headers
    Given I have the proper authentication
    When I set get parameters "per_page" with value "2"
    And I set get parameters "page" with value "1"
    And I set get parameters "query" with value "Matt Li User"
    Then I should see results of type "users"
    And I should not see component "product_types"
    And I should see component "search_type" with child component "user" as selected
    But I should not see component "search_types" and child component "product" as selected

  Scenario Outline: Discover Contextual Search
    # Authentication block that will se the headers
    Given I have the proper authentication
    When I set get parameters "per_page" with value "2"
    And I set get parameters "page" with value "1"
    And I set get parameters "query" with value "floral <product_type>"
    Then I should see response with results
    And I should see results of type "products"
    And I should see component "product_types" and child component "<product_type>" as selected
    But I should not see component "product_types" and child component "prints" as selected
    And I should see component "search_types" and child component "product" as selected
    But I should not see component "search_type" with child component "user" as selected

    Examples:
    |product_type|
    | tshirt |
    |mugs    |
    |tapestries|
    |rugs   |
