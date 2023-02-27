*** Settings ***
Library    ../../Locators/LoginLocators.py
Resource    base_actions.resource
Resource    ../Pages/login.resource
Variables    ../../../Resources/Variables/UserInfo.py
Variables    ../../../Resources/Variables/SuccessMessage.py

*** Keywords ***
Log in to the Admin portal
    Open Login Page
    Enter login     ${DEFAULT_LOGIN}
    Enter password  ${DEFAULT_PASSWORD}
    Click continue btn

Verify admin confirm code
    Verify message  ${LOGIN_FORM}   ${ADMIN_CONFIRM_CODE}
