*** Settings ***
Documentation           Test Suite for Admin Log In
Resource    Resources/Setup/webdriver_manager.resource
Resource    POM/Keywords/Modules/login_actions.resource
Resource    POM/Keywords/Modules/admin_actions.resource
Variables   Resources/Variables/Titles.py
Variables   Resources/Variables/Countries.py

Test Setup    Open Chrome Browser


*** Test Cases ***
Check ability to add New Test Center with valid data
    Fail    Bug report - https://is-takamol.atlassian.net/browse/PVPE-1556
    Log In By Api To The Admin Portal
    Register New Test Center

Check ability to add New Test Center with already existing email
    Skip    todo

Check an ability to see the specific message after filtration
    Log In By Api To The Admin Portal
    Open Test Centers Page
    Verify Title Test Center
    Select Dropdown County   ${MONTENEGRO}
    Click Button Search
    Verify No Data Available    spa=False

Check an active Admin can view Edit Test Center form
    Skip    todo
