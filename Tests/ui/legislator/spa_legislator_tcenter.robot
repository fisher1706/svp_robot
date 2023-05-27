*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_tcenter_action.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Create Entities And Log In
...     is_legislator_activate=True
...     login_tcenter=False
...     is_tcenter=True


*** Test Cases ***
C9169 Checking the ability to add new Test Center with valid data
    Verify Adding New Test Center   multiple_categories=False

C9181 Checking the ability to select one/multiple categories
    Verify Adding New Test Center   multiple_categories=True

C9183 C9184 Checking the ability to search entry by filters and clear filters on Test Centers tab
    Test Check Filters And Clear Filters Test Centers Tab

C9180 Checking that there is no ability to add new Test Center with empty form
    Test Add New Tcenter With Empty Form

C9171 C9179 Checking the ability to add owner with registered email
    Test Check Ability To Add Owner With Registered Email

C9182 Checking the ability to see the list of Test Centers pagination
    Test Check Ability See The List Of Test Centers Pagination

C9178 Checking the ability to add new Test Center with invalid data
    Test Check Ability To Add New Tcenter With Invalid Data

C9189 Checking that Legislator can view Edit Test Center form
    Test Can View Edit Tcenter Form

C9190 Checking that Legislator can edit a Test Center with valid data
    Test Can Edit Tcenter With Valid Data

C9191 Checking that Legislator can not edit owner with registered email and duplicate name
    Test Can Not Edit Owner With Registered Email And Duplicate Name

C11914 Checking that Legislator can edit test center with invalid data
    Test Can Edit Test Center With Invalid Data

C9193 C9194 Checking that Legislator can not edit test center with empty form and can not edit country field
    Test Edit Test Center With Empty Form And Can Not Edit Country Field

C9281 Checking that Legislator can view Test Center information
    Test Can View Test Center Information

C9281 Checking that Legislator can delete a Test Center
    Test Can Delete Test Center

C9282 Checking that Legislator can view the list of upload files of deleted Test Center
    Test Can View The List Of Upload Files Of Deleted Test Center
