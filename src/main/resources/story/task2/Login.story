Description: Scenarios for login

Scenario: Successfull login
Given I am on the main application page
When I click on element located by `xpath((//div/a[text()="Log in"])[1])`
When I login to the application
Then the page with the URL containing '/boards' is loaded

Scenario: Verify user logged in

Scenario: Sign out
Given I am on the main application page
When I click on element located by `xpath(//span[contains(@title,"Elena Capienko")])`
When I wait until element located by `xpath(//h2[text()="Account"])` appears
When I click on element located by `xpath(//button/span[text()="Log out"])`
When I wait until element located by `id(logout-submit)` appears
When I click on element located by `id(logout-submit)`
Then the page with the URL containing '/home' is loaded

Scenario: Verify user logged out

Scenario: Failed login - incorrect email
Given I am on the main application page
When I remove all cookies from current domain
When I click on element located by `xpath((//div/a[text()="Log in"])[1])`
When I wait until element located by `id(user)` appears
When I add `#{generate(Internet.emailAddress)}` to field located `id(user)`
When I click on element located `id(login)`
When I wait until element located by `id(password)` appears
When I add `${password}` to field located `id(password)`
When I click on element located `xpath(//*[@id="login" or @id="login-submit"])`
Then the text 'Incorrect email address and / or password.' exists

Scenario: Verify user has not logged with incorrect email

Scenario: Failed login - incorrect password
Given I am on the main application page
When I remove all cookies from current domain
When I click on element located by `xpath((//div/a[text()="Log in"])[1])`
When I wait until element located by `id(user)` appears
When I add `${email}` to field located `id(user)`
When I click on element located `id(login)`
When I wait until element located by `id(password)` appears
When I add `#{generate(Internet.password)}` to field located `id(password)`
When I click on element located `id(login-submit)`
Then the text 'Incorrect email address and / or password.' exists

Scenario: Verify user not logged with incorrect password
