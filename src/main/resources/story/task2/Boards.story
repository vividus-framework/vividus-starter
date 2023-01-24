Description: Creation, edition and deletion of boards

Scenario: Successfull login
Given I am on the main application page
When I click on element located by `xpath((//div/a[text()="Log in"])[1])`
When I login to the application
When I wait until the page title contains the text 'Boards'
When I ESTABLISH baseline with name `home-page-without-board`

Scenario: Add board
Given I am on the main application page
When I click on element located by `xpath(//button[@data-testid="header-create-menu-button"])`
When I wait until element located by `xpath(//section[@data-testid="header-create-menu-popover"])` appears
When I change context to element located `xpath(//section[@data-testid="header-create-menu-popover"])`
When I ESTABLISH baseline with name `create-menu-popover`
When I click on element located by `xpath(//button[@data-testid="header-create-board-button"])`
When I wait until element located by `xpath(//input[@data-testid="create-board-title-input"])` appears
When I add `${boardTitle}` to field located by `xpath(//input[@data-testid="create-board-title-input"])`
When I wait until element located by `xpath(//button[@data-testid="create-board-submit-button"])` appears
When I click on element located by `xpath(//button[@data-testid="create-board-submit-button"])`
Then the page with the URL containing '/${boardTitle}' is loaded

Scenario: Add lists to the board
When I find >= '1' elements by By.xpath(//span[@class="placeholder"]) and for each element do
|step																							|
|When I click on element located by `xpath(//span[contains(@class,"icon-add")])`				|
|When I wait until element located by `xpath(//input[contains(@placeholder,"Enter")])`			|
|When I add `<listTitle>` to field located by `xpath(//input[contains(@placeholder,"Enter")])`	|
|When I click on element located by `xpath(//input[@value="Add list"])`							|
Examples:
|listTitle										|
|#{generate(DungeonsAndDragons.rangedWeapons)}	|
|#{generate(Name.lastName)}						|
|#{generate(SiliconValley.company)}				|

Scenario: Add cards to lists
When I wait until element located by `xpath(//a[contains(@class,"open-card-composer")]/span[1])` appears
When I click on element located by `xpath(//a[contains(@class,"open-card-composer")]/span[1])`
When I wait until element located by `xpath(//textarea[contains(@placeholder,"Enter")])` appears
When I add `<cardTitle>` to field located by `xpath(//textarea[contains(@placeholder,"Enter")])`
When I click on element located by `xpath(//input[@value="Add card"])`
When I find >= '1' elements by By.xpath(//div[contains(@class,"list-wrapper")]) and for each element do
|step																										|
|When I click on element located by `xpath(//a[contains(@class,"open-card-composer")])`						|
|When I wait until element located by `xpath(//textarea[contains(@placeholder,"Enter a title")])` appears	|
|When I add `<cardTitle>` to field located by `xpath(//textarea[contains(@placeholder,"Enter a title")])`	|
|When I click on element located by `xpath(//input[@value="Add card"])`										|
Examples:
|cardTitle							|
|#{generate(Artist.name)}			|
|#{generate(BigBangTheory.quote)}	|
|#{generate(Dog.breed)}				|

Scenario: Close the board
When I wait until element located by `xpath(//a[contains(@title,"${boardTitle}")])` appears
When I change context to element located `xpath(//a[contains(@title,"${boardTitle}")])`
When I hover mouse over element located `xpath(//a[contains(@title,"${boardTitle}")])`
When I wait until element located by `xpath(//span[@aria-label="OverflowMenuHorizontalIcon"])` appears
When I click on element located by `xpath(//span[@aria-label="OverflowMenuHorizontalIcon"])`
When I wait until element located by `xpath(//button[@title="Close board"])` appears
When I click on element located by `xpath(//button[@title="Close board"])`
When I wait until element located by `xpath(//button[@title="Close"])` appears
When I click on element located by `xpath(//button[@title="Close"])`
When I wait until element located by `xpath(//button)` contains text `Permanently delete board`
Then the text '${boardTitle} is closed.' exists

Scenario: Delete the board
When I click on element located by `xpath(//button[@data-testid = "close-board-delete-board-button"])`
When I wait until element located by `xpath(//button[@data-testid = "close-board-delete-board-confirm-button"])` appears
When I click on element located by `xpath(//button[@data-testid = "close-board-delete-board-confirm-button"])`
When I wait until the page title contains the text 'Boards'

Scenario: Visual check the board is deleted
Given I am on the main application page
When I COMPARE_AGAINST baseline with name `home-page-without-board`

Scenario: Verify the board is deleted

Scenario: Log out
Given I am on the main application page
When I click on element located by `xpath(//span[contains(@title,"Elena Capienko")])`
When I wait until element located by `xpath(//h2[text()="Account"])` appears
When I change context to element located `xpath(//section[@data-testid="header-member-menu-popover"])`
When I click on element located by `xpath(//button/span[text()="Log out"])`
When I wait until element located by `id(logout-submit)` appears
When I click on element located by `id(logout-submit)`
When I remove all cookies from current domain
Then the page with the URL containing '/home' is loaded

Scenario: Verify user logged out
