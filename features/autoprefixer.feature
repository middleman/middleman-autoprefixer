Feature: Postprocessing stylesheets with Autoprefixer in different configurations

  Scenario: Using defaults
    Given the Server is running at "default-app"
    When I go to "/stylesheets/page.css"
    Then I should not see "-ms-border-radius"
    And I should see "border-radius"

  Scenario: Inline html
    Given the Server is running at "inline-app"
    When I go to "/index.html"
    Then I should not see "-ms-border-radius"
    And I should see "border-radius"

  Scenario: Passing options in a block
    Given the Server is running at "block-app"
    When I go to "/stylesheets/page.css"
    Then I should see "-webkit-flex"
    And I should see "-moz-box"
    And I should see "-webkit-linear-gradient"
    And I should see "-moz-linear-gradient"

  Scenario: Passing options in a hash
    Given the Server is running at "hash-app"
    When I go to "/stylesheets/page.css"
    Then I should see "-webkit-transition"
    And I should not see "-moz-transition"

  Scenario: Cascading is on
    Given the Server is running at "cascading-on-app"
    When I go to "/stylesheets/page.css"
    Then I should see:
      """
        -webkit-box-sizing: border-box;
           -moz-box-sizing: border-box;
                box-sizing: border-box;
      """

  Scenario: Cascading is off
    Given the Server is running at "cascading-off-app"
    When I go to "/stylesheets/page.css"
    Then I should see:
      """
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
      """
