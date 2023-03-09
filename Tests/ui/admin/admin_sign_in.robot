*** Settings ***
Documentation           Test Suite for Admin Log In
Resource    ../../../Resources/Setup/webdriver_manager.robot
Resource    ../../../POM/Keywords/Modules/login_actions.resource
Resource    ../../../POM/Keywords/Modules/dashboard_actions.resource
Variables   Resources/Variables/UserInfo.py
Variables   ../../../Resources/Variables/LoginDataset.py

Test Setup    Open Chrome Browser
*** Test Cases ***
Test Check valid Login and Password
    Log in to the Admin portal  ${DEFAULT_LOGIN}    ${DEFAULT_PASSWORD}
    Verify Admin Confirm Code
    Proceed 2fa web
    Verify Admin Dashboard Welcome Text

Test Check invalid login and password
    [Template]  Login with invalid credentials
    @{INVALID_LOGIN_DATASET}
    @{INVALID_PASSWORD_DATASET}

Test C6250 Check log in without entering email and password
    Log in to the Admin portal  ${EMPTY}    ${EMPTY}    ${FALSE}

*** Keywords ***
Login with invalid credentials
    [Arguments]     @{item}
    Log in to the Admin portal  ${item}[0]  ${item}[1]
    Verify login error msg  ${item}[2]
