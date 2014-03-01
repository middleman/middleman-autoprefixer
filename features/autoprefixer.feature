Feature: Postprocessing stylesheets with Autoprefixer in different configurations

  Scenario: Using defaults
    Given the Server is running at "default-app"
    When I go to "/stylesheets/page.css"
    Then I should not see "-ms-border-radius"
    And I should see "border-radius"

  Scenario: Passing options in a block
    Given the Server is running at "block-app"
    When I go to "/stylesheets/page.css"
    Then I should see "-webkit-linear-gradient"
    And I should see "-moz-linear-gradient"

  Scenario: Passing options in a hash
    Given the Server is running at "hash-app"
    When I go to "/stylesheets/page.css"
    Then I should see "-webkit-transition"
    And I should not see "-moz-transition"
