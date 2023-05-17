*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_transaction_history_actions.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True


*** Test Cases ***
Checking the ability to search entry by filters and clear filters on Transaction History tab
    Test Check Filters And Clear Filters

C9319 C9320 Checking transaction statuses on Transaction History tab as a a Test Center
    Verify Transactions Statuses

Check the ability to download invoice as a Test Center
    Test Download Certificate

Check the ability to download invoice on view payment details as a Test Center
    Test Download Certificate On View Payment Details
