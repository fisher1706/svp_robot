*** Settings ***
Documentation       Test Suite for Admin Test Centers

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_actions.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Variables           Resources/Variables/Titles.py
Variables           Resources/Variables/Countries.py
Variables           Resources/Variables/WarningMessage.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Check ability to add New Test Center with valid data
    [Documentation]    For this test case need to be created Legislator with the name "Autotest". In the future need
    ...    to add logic for creating this data before the first run of tests. Currently, it creates manually
    # TODO: On demo side it still reproduce because of a lot of already created legislator users type
    # Fail    Bug report - https://is-takamol.atlassian.net/browse/PVPE-1556
    Log In By Api To The Admin Portal
    Create New Test Center

Check ability to add New Test Center with already existing email
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True    login=False
    Verify Error Message On Test Center Create    msg=${EMAIL_IS_IN_USE}    is_email=True

Check ability to add New Test Center with already existing name
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True    login=False
    Verify Error Message On Test Center Create    msg=${TC_NAME_IS_REGISTERED}    is_name=True

Check an ability to see the specific message after filtration
    Log In By Api To The Admin Portal
    Open Test Centers Page
    Select Dropdown County    ${MONACO}
    Click Button Search
    Verify No Data Available    spa=False

Check an active Admin can view Edit Test Center form
    Create Entities And Log In    is_tcenter=True    login=False
    ${tcenter_account}=    Get Test Center Account
    ${legislator_account}=    Get Legislator Account
    Log In By Api To The Admin Portal
    Open Test Centers Page
    Fill Filter Name    ${tcenter_account.en_name}
    Click Button Search
    Wait Spinners To Disappear
    Select View Of Last Entry
    Verify Tcenters View Fields    ${tcenter_account}    ${legislator_account.en_name}

Check an active Admin can edit Test Center with valid data
    Skip    todo

Check an active Admin can not edit owner with registered email
    Skip    todo
