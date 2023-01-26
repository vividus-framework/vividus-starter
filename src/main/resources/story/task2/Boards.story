Description: Creation, edition and deletion of boards

Scenario: Successfull login
Given I am on the main application page
When I login to the application
When I verify user is logged in
When I click on element located by `xpath((//span[text()="Boards"])[1])`
When I wait until the page title contains the text 'Boards'
When I ESTABLISH baseline with name `home-page-without-board`

Scenario: Add board
Given I am on the main application page
When I click on element located by `xpath(//button[@data-testid="header-create-menu-button"])`
When I wait until element located by `xpath(//section[@data-testid="header-create-menu-popover"])` appears
When I change context to element located `xpath(//section[@data-testid="header-create-menu-popover"])`
When I ${baselineAction} baseline with name `create-menu-popover` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE	|
|1							|
When I click on element located by `xpath(//button[@data-testid="header-create-board-button"])`
When I wait until element located by `xpath(//input[@data-testid="create-board-title-input"])` appears
When I enter `${boardTitle}` in field located by `xpath(//input[@data-testid="create-board-title-input"])`
When I wait until element located by `xpath(//button[@data-testid="create-board-submit-button" and not(disabled)])` appears
When I click on element located by `xpath(//button[@data-testid="create-board-submit-button"])`
Then the page with the URL containing '/${boardTitle}' is loaded

Scenario: Navigate to the newly created board
Given I am on the main application page
When I click on element located by `xpath(//a[@data-testid="home-team-boards-tab"])`
When I wait until element located by `xpath(//div[@class="all-boards"])` appears
When I click on element located by `xpath(//a[@class="board-tile" and contains(@href,"${boardTitle}")])`
When I wait until the page title contains the text '${boardTitle}'

Scenario: Delete old lists if they exist
When I find >= '1' elements by By.xpath(//div[contains(@class,"js-list-content")]) and for each element do
|step																				|
|When I click on element located by `xpath(//a[@aria-label="List actions"])`		|
|When I wait until element located by `xpath(//a[@class="js-close-list"])` appears	|
|When I click on element located by `xpath(//a[@class="js-close-list"])`			|

Scenario: Add lists to the board
When I wait until element located by `xpath(//div[contains(@class,"js-add-list")])` appears
When I create list with `<listTitle>` if board loaded without lists
When I wait until element located by `xpath((//div[contains(@class,"js-list-content")])[1])` appears
Examples:
|listTitle										|
|#{generate(DungeonsAndDragons.rangedWeapons)}	|

Scenario: Add cards to lists
When I change context to element located `xpath((//div[contains(@class,"js-list-content")])[1])`
When I create card with `<cardTitle>` in new board lists
When I wait until element located by `xpath(//span[@class="show-sidebar-button-react-root"])` appears
Examples:
|cardTitle										|
|#{generate(Artist.name)}						|
|#{generate(DungeonsAndDragons.meleeWeapons)}	|
|#{generate(BigBangTheory.character)}			|

Scenario: Close the board
When I click on element located by `xpath(//button[@aria-label="Show menu"])`
When I wait until element located by `xpath(//div[contains(@class,"js-board-menu-content-wrapper")])` appears
When I change context to element located `xpath(//div[contains(@class,"js-board-menu-content-wrapper")])`
When I click on element located by `xpath(//a[contains(@class,"js-open-more")])`
When I wait until element located by `xpath(//a[contains(@class,"js-close-board")])` appears
When I click on element located by `xpath(//a[contains(@class,"js-close-board")])`
When I wait until element located by `xpath(//div[@class="pop-over is-shown"])` appears
When I change context to element located `xpath(//div[@class="pop-over is-shown"])`
When I click on element located by `xpath(//input[@value="Close"])`
When I change context to element located `id(popover-boundary)`
When I wait until element located by `xpath(//button[@data-testid="close-board-delete-board-button"])` appears
Then the text '${boardTitle} is closed.' exists

Scenario: Delete the board
When I click on element located by `xpath(//button[@data-testid="close-board-delete-board-button"])`
When I wait until element located by `xpath(//button[@data-testid="close-board-delete-board-confirm-button"])` appears
When I click on element located by `xpath(//button[@data-testid="close-board-delete-board-confirm-button"])`
When I wait until element located by `xpath(//div[@class="home-container"])` appears

Scenario: Verify the board is deleted (with visual check)
Given I am on the main application page
When I click on element located by `xpath((//span[contains(text(),"Boards")])[1])`
When I wait until the page title contains the text 'Boards'
When I wait until element located by `xpath(//button[contains(@class,"view-all-closed-boards-button")])` appears
When I click on element located by `xpath(//button[contains(@class,"view-all-closed-boards-button")])`
When I wait until element located by `xpath(//h2[text()="Closed boards"])` appears
When I wait until number of elements located by `xpath(//a[text()="${boardTitle}"])` is = 0
When I click on element located by `xpath(//h2[text()="Closed boards"]//following-sibling::button//child::span[@aria-label="CloseIcon"])`
When I wait until element located by `xpath(//h2[text()="Closed boards"])` disappears
When I click on element located by `xpath((//span[text()="Boards"])[1])`
When I wait until the page title contains the text 'Boards'
When I COMPARE_AGAINST baseline with name `home-page-without-board`

Scenario: Log out
Given I am on the main application page
When I log out from the application
When I verify user is not logged in
