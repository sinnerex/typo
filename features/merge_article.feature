Feature: Merge Articles
  As a blog administrator
  In order to manage properly all the articles
  I want to be able to merge similar article

Background: articles have been added to database

  Given the following articles exist:
  | article_id              | author | title        	            | text                         |
  | merge_1                 | admin  | the meaning of life          | this is a long long article  |
  | merge_2                 | user_1 | my story                     | this is an happy article     |
  | merge_3                 | user_2 | my way                       | this is a boring article     |
  | merge_4                 | admin  | show me the meaning of life  | bring me to enlightment      |

  And the following comments exists:
  | comment_id | article_fk_id | author  | text |
  | comment_1  | merge_1       | Gandalf | Wow  |
  | comment_2  | merge_2       | Frodo   | Hi ! | 
  | comment_3  | merge_3       | Legolas | Yep  |
  | comment_4  | merge_4       | Gimli   | Bla  |
 
Scenario: Merge two articles
   Given I'am editing "merge_1" on the article edit page
   When I fill in the "article_id" with "merge_2"
   And I press "Merge"
   Then The new article should contains the text of both previous articles
   And The author is the "merge_1" author
   And Comments from both merged articles are propertly migrated to the new article
   And The title is the "merge_1" title
