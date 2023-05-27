*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_labor_action.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True


*** Test Cases ***
Checking validation of edit email field on Labors tab
    Test Validation Edit Email On Labors Tab

Checking the ability to edit email on Labors tab
    Test Edit Email On Labors Tab

Checking pagination and search result value on Labors tab
    Test Pagination And Search Result Value

Checking all count on Labors tab
    Test All Count On Labors Tab

Checking the ability to search entry by filters and clear filters on Labors table
    Test Search Entry By Filters On Labors Table    tcenter

Checking counts on Labors tab
    Test Counts On Labors Tab
