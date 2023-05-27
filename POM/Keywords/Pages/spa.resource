*** Settings ***
Library         Browser
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/SPALocators.py


*** Keywords ***
Click Clear Filter Button
    Click Button    ${BTN_CLEAR_FILTER}

Verify Active Next Button
    Wait For Elements State    ${BTN_NEXT}    enabled

Wait Until No Data Available Disappear
    Wait For Elements State    ${NO_DATA_AVAILABLE}    hidden

Click On Profile Menu
    Click Button    ${USER_INFO}

Click Change Password
    Click Button    ${CHANGE_PASSWORD}

Click Account Info
    Click Button    ${ACCOUNT_INFORMATION}

Click Logout Button
    Click Button    ${LOGOUT}

Click Button Next
    Click Button    ${BTN_NEXT}
