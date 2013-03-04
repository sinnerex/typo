Feature: Create Blog
  As an author
  In order to gift my thoughts to the world
  I want to create a blog

Background: articles have been added to database

  Given the following articles exist:
  | article_id              | author | title        	            | text                         |
  | merge_1                 | admin  | the meaning of life          | this is a long long article  |

  Scenario: Create blog page shown
    Given I am on the home page
    Then I should see "Welcome"
    And I should see "My Shiny Weblog!"

  Scenario: Create blog page not shown when blog created
    Given the blog is set up
    When I am on the home page
    Then I should not see "My Shiny Weblog!"
    And I should see "Teh Blag"

  Scenario: Merge two articles
   Given I'am editing "merge_1" on the article edit page
   Then I should not see "Merge Articles" section
