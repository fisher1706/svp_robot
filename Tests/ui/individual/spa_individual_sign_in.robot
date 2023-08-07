*** Settings ***
Documentation       Test Suite for Individual Log In

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/individual_sign_in_actions.resource
Variables           Resources/Variables/LoginDataset.py
Variables           POM/Locators/IndividualBaseLocators.py
Variables           Resources/Variables/SuccessMessage.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Check Valid Login And Password
    Log In To The Spa Portal
    ...     login=${INDIVIDUAL_DEFAULT_LOGIN}
    ...     password=${INDIVIDUAL_DEFAULT_PASSWORD}
    ...     locator=${ACCOUNT_DASHBOARD}
    ...     message=${MSG_SUCCESS_INDIVIDUAL_LOGIN}

Check Invalid Login
    Login To Spa Portal With Invalid Credentials      @{INVALID_INDIVIDUAL_LOGIN_DATASET}

Check Invalid Password
    Login To Spa Portal With Invalid Credentials      @{INVALID_INDIVIDUAL_LOGIN_DATASET}

Check Log In Without Entering Email And Password
    Open Login Page
    Enter Login And Password    ${EMPTY}    ${EMPTY}    False

Check Ability Log Out From System
    Log In To The Spa Portal
    ...     login=${INDIVIDUAL_DEFAULT_LOGIN}
    ...     password=${INDIVIDUAL_DEFAULT_PASSWORD}
    ...     locator=${ACCOUNT_DASHBOARD}
    ...     message=${MSG_SUCCESS_INDIVIDUAL_LOGIN}
    Log Out User
