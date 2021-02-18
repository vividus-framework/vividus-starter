Description: Simple visual tests;

Scenario: Visual test of a page
Meta:
    @skip
When I compare against baseline with `page`

Scenario: Visual test of context element
Given I am on a page with the URL 'https://github.com/vividus-framework'
When I change context to element located `By.xpath(//img[@itemprop])`
When I compare against baseline with `vividus-logo`
