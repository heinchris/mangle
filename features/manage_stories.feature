Feature: Manage stories
  In order to track our stories
  The Product Manager wants to see all stories listed out

  Background:
    Given I am a new, authenticated user

  Scenario: The story list display will be sorted by priority
    Given the following stories:
      |name|narrative|estimate|priority|
      |unnecessary|clever|3|3|
      |emergency|still clever|1| 1|
      |normal|cleverest|2|2|

    When I go to the stories page
    Then I should see the following stories:
      |Name|Narrative|Estimate|Priority|
      |emergency|still clever|1| 1|
      |normal|cleverest|2|2|
      |unnecessary|clever|3|3|

  Scenario: The Story should be able to be assigned to an Iteration
    Given the following story:
      |name|narrative|estimate|priority|
      |story1|clever|3|3|
      And the following iteration:
      |name|start_date|end_date|
      |Iteration 1|05/05/2011|05/12/2011|
      And I am on the edit story page for story1
    When I select "Iteration 1" from "Iteration"
      And I press "Update Story"
    Then I should see "Iteration 1"


  Scenario: I can create stories on the story index page
    Given I am on the stories page
    When I fill in "Name" with "story1"
      And I fill in "Narrative" with "narrative1"
      And I fill in "Estimate" with "1"
      And I fill in "Priority" with "1"
      And I press "Create Story"
    Then I should see the following stories:
      |Name|Narrative|Estimate|Priority|
      |story1|narrative1|1|1|


  Scenario: If I have a story that does not belong to an iteration it should still show
    Given the following story:
      |name|narrative|estimate|priority|
      |story1|clever|3|3|
    When I go to the show story page for story1
    Then I should see "story1"

  Scenario: Create story fails with errors on index page
    Given I am on the stories page
    When I press "Create Story"
    Then I should see "stories"
      And I should see "errors"

  Scenario: Story's are paginatable
    Given the following stories:
      |name|narrative|estimate|priority|
      |unnecessary|clever|3|3|
      |emergency|still clever|1| 1|
      |normal1|cleverest|2|2|
      |normal2|cleverest|2|2|
      |normal3|cleverest|2|2|
      |normal4|cleverest|2|2|
      |normal5|cleverest|2|2|
      |normal6|cleverest|2|2|
    And I am on the stories page
    Then I should see the following stories:
      |Name|Narrative|Estimate|Priority|
      |emergency|still clever|1|1|
      |normal1|cleverest|2|2|
      |normal2|cleverest|2|2|
