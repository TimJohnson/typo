Feature: Merge Articles
    As an administrator
    In order to prevent similar articles to flood a blog
    I want to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following contents exist:

      | title        | author  | body        | published | id |
      | First        | admin   | first       | t         | 1  |
      | Hello World! | admin   | hi          | u         | 2  |
    Given I am logged into the admin panel
    And I follow "First"
    And I fill in "merge_with" with "2"
    And I press "Merge"

  Scenario: Merged article should contain text of both previous articles
    Given I am on all the article page
    Then I should see "First"
    And I should not see "Hello World!"
    When I follow "First"
    Then I should see the content "first hi"

  Scenario: Merged article should have one author
    Given I am on the all article page
    When I follow "First"
    Then I should see the title "First"
    And I should not see the title "Hello World"

  Scenario: Title of merged article should be title from a previous article

  Scenario: Comments from previous articles should carry over to merged article
