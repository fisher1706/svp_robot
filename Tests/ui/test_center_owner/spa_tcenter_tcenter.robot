*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_tcenter_action.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True
...     is_multiple_categories=True


*** Test Cases ***
C9183 C9184 Checking the ability to search entry by filters and clear filters on Test Centers tab
    Test Check Filters And Clear Filters Test Centers Tab

C11918 Checking that Test Center Owner can view Edit Test Center form
    Test Can View Edit Tcenter Form     is_legislator=False

C11920 Checking that Test Center Owner can edit a Test Center with valid data
    Test Can Edit Tcenter With Valid Data       is_legislator=False

C12027 Checking that Test Center Owner is not able to change test center Name to Name which already exists
    Test Can Not Edit Owner With Registered Email And Duplicate Name    is_legislator=False

C11922 Checking that Test Center Owner can edit test center with invalid data
    Test Can Edit Test Center With Invalid Data     is_legislator=False

C11923 C11924 Checking that Test Center Owner can not edit test center with empty form and can not edit country field
    Test Edit Test Center With Empty Form And Can Not Edit Country Field    is_legislator=False

C9281 Checking that Test Center Owner can view Test Center information
    Test Can View Test Center Information
