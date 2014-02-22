Feature: Postprocessing stylesheets with Autoprefixer

  Scenario: Options are passed in a block
    Given the Server is running at "block-app"
    When I go to "/stylesheets/page.css"
    Then I should see "-webkit-linear-gradient"
    Then I should see "-moz-linear-gradient"

  Scenario: Options are passed in a hash
    Given the Server is running at "hash-app"
    When I go to "/stylesheets/page.css"
    Then I should see "-webkit-transition"
    Then I should not see "-moz-transition"
