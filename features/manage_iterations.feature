Feature: Manage iterations
  In order to know what stories are being done in a time period
  the project manager
  wants to be able to view the iterations on the website

Background:
    Given I am a new, authenticated user

Scenario: See the stories on the show iteration page
  Given the following iteration:
    |id|name|start_date|end_date|
    |1|Iteration1|05/05/2011|05/12/2011|
    And the following stories:
    |name|narrative|estimate|priority|iteration_id|
    |story1|narrative1|3|3|1|
  And I am on the show iteration page for Iteration1
  Then I should see "story1"

Scenario: See the stories on the show iteration page a new way
  Given the following iteration:
    |name|start_date|end_date|
    |Iteration1|05/05/2011|05/12/2011|
    And the following stories assigned to Iteration1:
    |name|narrative|estimate|priority|
    |story1|narrative1|3|3|
  And I am on the show iteration page for Iteration1

  Then I should see "story1"


Scenario: See multiple stories on the show iteration page
  Given the following iteration:
    |name|start_date|end_date|
    |Iteration1|05/05/2011|05/12/2011|
    And the following stories assigned to Iteration1:
    |name|narrative|estimate|priority|
    |story1|narrative1|3|3|
    |story2|narrative2|1|1|
  And I am on the show iteration page for Iteration1
  Then I should see "story1"
    And I should see "story2"


Scenario: See no stories on the show iteration page
  Given the following iteration:
    |name|start_date|end_date|
    |Iteration1|05/05/2011|05/12/2011|
    And the following stories:
    |name|narrative|estimate|priority|
    |story1|narrative1|3|3|
    |story2|narrative2|1|1|
  And I am on the show iteration page for Iteration1
  Then I should not see "story1"
    And I should not see "story2"

Scenario: Iteration Page should show the total estimate of the stories assigned
  Given the following iteration:
      |name|start_date|end_date|
      |Iteration1|05/05/2011|05/12/2011|
      And the following stories assigned to Iteration1:
      |name|narrative|estimate|priority|
      |story1|narrative1|3|3|
      |story2|narrative2|1|1|
    And I am on the show iteration page for Iteration1
    Then I should see "4 Points"

Scenario: Iteration Page should show 0 points if there are no stories assigned
  Given the following iteration:
      |name|start_date|end_date|
      |Iteration1|05/05/2011|05/12/2011|
      And the following stories:
      |name|narrative|estimate|priority|
      |story1|narrative1|3|3|
      |story2|narrative2|1|1|
    And I am on the show iteration page for Iteration1
    Then I should see "0 Points"

