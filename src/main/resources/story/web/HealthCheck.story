Description: Simple story to check the page availability;

Scenario: Open application under test
Given I am on the main application page

Scenario: Verify page title
Then the page title is equal to 'Vividus Test Site'
