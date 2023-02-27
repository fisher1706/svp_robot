*** Settings ***
Variables    ../../Locators/DashboardLocators.py
Resource    base_actions.resource
Variables    ../../../Resources/Variables/SuccessMessage.py

*** Keywords ***
Verify admin dashboard welcome text
    Verify message  ${DASHBOARD_WELCOME}    ${DASHBOARD_WELCOME_TEXT}
