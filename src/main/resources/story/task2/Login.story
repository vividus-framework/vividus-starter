Description: Scenarios for login

Scenario: Successfull login
Given I am on the main application page
When I login to the application
When I verify user is logged in

Scenario: Log out
Given I am on the main application page
When I log out from the application
When I verify user is not logged in

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
When I verify user is not logged in

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
When I verify user is not logged in
