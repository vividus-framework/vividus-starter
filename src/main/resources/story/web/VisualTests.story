Description: Simple visual tests;

Scenario: Open google search main page
Given I am on a page with the URL 'https://www.example.com/'

Scenario: Visual test of a page
When I compare against baseline with `page`

Scenario: Visual test of context element
Given I am on a page with the URL 'https://github.com/vividus-framework'
When I change context to an element by By.xpath(//img[@itemprop])
When I compare against baseline with `vividus-logo`
