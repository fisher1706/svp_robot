*** Settings ***
Documentation       Test Suite for Admin Log In

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Variables           Resources/Variables/UserInfo.py
Variables           Resources/Variables/LoginDataset.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Check valid Login and Password
    Log In To The Admin Portal

Check invalid login
    [Template]    Login To Admin Portal With Invalid Credentials
    @{INVALID_LOGIN_DATASET}

Check invalid password
    [Template]    Login To Admin Portal With Invalid Credentials
    @{INVALID_PASSWORD_DATASET}

C6250 Check log in without entering email and password
    Open Login Page
    Enter Login And Password    ${EMPTY}    ${EMPTY}    False


*** Keywords ***
Login To Admin Portal With Invalid Credentials
    [Arguments]    @{item}
    Open Login Page
    Enter Login And Password    ${item}[0]    ${item}[1]
    TRY
        Verify Login Error Msg    ${item}[2][0]
    EXCEPT
        Verify Login Error Msg    ${item}[2][1]
    END
