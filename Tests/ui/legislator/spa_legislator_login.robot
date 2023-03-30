*** Settings ***
Documentation       Registration Legislator to SVP

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Pages/login.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_registration_actions.resource
Resource            POM/Keywords/Pages/spa_change_password.resource
Variables           Resources/Variables/LoginDataset.py
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/UserInfo.py

Test Setup          Open Chrome Browser


*** Test Cases ***
C8820 Check invalid login
    [Template]    Login To SPA Portal With Invalid Credentials
    @{INVALID_LOGIN_DATASET}

ENDC8820 Check invalid and password
    [Template]    Login To SPA Portal With Invalid Credentials
    @{INVALID_PASSWORD_DATASET}

Check valid Login and Password 2fa via email
    Create Entities And Log In
    ...    is_legislator_activate=True
    ...    login_tcenter=False
    ...    two_factor_verification=${AUTH_EMAIL}
    Verify Title Uploaded Files

C8819 Check valid Login and Password
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files

C8821 Check log in without entering email and password
    Open SPA Login Page
    Enter Login And Password    login= \    password= \    is_click=False

C8840 Check ability to log out from system
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Log Out User

C8863 Back to Home page from 'Confirm verification code'
    Open SPA Login Page
    Enter Login And Password    ${LEGISLATOR_LOGIN}    ${DEFAULT_PASSWORD}
    Verify Confirm Code
    Click Back Button
    Verify Title Spa Professional Cccreditation Program


*** Keywords ***
Login To SPA Portal With Invalid Credentials
    [Arguments]    @{item}
    Open SPA Login Page
    Enter Login And Password    ${item}[0]    ${item}[1]
    Verify Login Error Msg    ${item}[2]
