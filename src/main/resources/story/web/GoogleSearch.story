Description: Simple story to test google search is working;

Scenario: Open google search main page
Given I am on the main application page
Then the page title is equal to 'Google'

Scenario: Search validation
When I enter `Vividus Framework` in field located `By.elementName(q)`
When I click on a button with the name 'btnK'
Then a link by By.linkUrl(https://github.com/vividus-framework) exists
