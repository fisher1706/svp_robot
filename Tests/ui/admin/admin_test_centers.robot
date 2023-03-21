*** Settings ***
Documentation           Test Suite for Admin Test Centers
Resource    Resources/Setup/webdriver_manager.resource
Resource    POM/Keywords/Modules/login_actions.resource
Resource    POM/Keywords/Modules/admin_actions.resource
Resource    POM/Keywords/Modules/backgrounds.resource
Variables   Resources/Variables/Titles.py
Variables   Resources/Variables/Countries.py
Variables   Resources/Variables/WarningMessage.py

Test Setup    Open Chrome Browser


*** Test Cases ***
Check ability to add New Test Center with valid data
    Fail    Bug report - https://is-takamol.atlassian.net/browse/PVPE-1556
    Log In By Api To The Admin Portal
    Create New Test Center

Check ability to add New Test Center with already existing email
    Fail    Bug report - https://is-takamol.atlassian.net/browse/PVPE-1556
    Create Entities And Log In  is_tcenter=True login=False
    Verify Error Message On Test Center Create  msg=${EMAIL_IS_EXIST}

Check an ability to see the specific message after filtration
    Log In By Api To The Admin Portal
    Open Test Centers Page
    Select Dropdown County   ${MONTENEGRO}
    Click Button Search
    Verify No Data Available    spa=False

Check an active Admin can view Edit Test Center form
    Create Entities And Log In  is_tcenter=True login=False
    ${account}=     Get Test Center Account
    Log In By Api To The Admin Portal
    Open Test Centers Page
    Fill Filter Name    ${account.en_name}
    Click Button Search
    Select View Of Last Entry
    Verify Tcenters View Fields     ${account}

Check an active Admin can edit Test Center with valid data
    Skip    todo

Check an active Admin can not edit owner with registered email
    Skip    todo
