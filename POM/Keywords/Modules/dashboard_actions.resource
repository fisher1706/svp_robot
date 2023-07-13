*** Settings ***
Variables       POM/Locators/DashboardLocators.py
Resource        base_actions.resource
Variables       Resources/Variables/SuccessMessage.py


*** Keywords ***
Verify Admin Dashboard Welcome Text
    Verify Text    ${DASHBOARD_WELCOME}    ${DASHBOARD_WELCOME_TEXT}

Verify Spa Dashboard Welcome Text
    [Arguments]    ${locator}       ${message}
    Verify Text     ${locator}       ${message}