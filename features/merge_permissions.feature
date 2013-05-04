Feature: User Permissions
  As a user
  In order to prevent certain users from having too much access
  I want to limit permissions

  Background:
    Given the blog is set up
    And I am not logged in as a admin
    Given the blog is set up with a non-admin
    And I am logged into the non-admin panel
    And the following articles exist:
      | title        | author  | body        | published | id |
      | First        | admin   | first       | t         | 1  |
      | Hello World! | admin   | hi          | u         | 2  |

Scenario: A non-administrator cannot merge articles
  Given I am on the new articles page
  When I follow "All Articles"
  Then I should see "Hello World!"
  And I should not see "Merge"