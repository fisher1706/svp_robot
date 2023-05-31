*** Settings ***
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/SPASessionManagementLocators.py
Variables       POM/Locators/SPALocators.py


*** Keywords ***
Click Session Management
    Click Button    ${BTN_SESSION_MANAGEMENT}

Click Apply
    Click Button    ${BTN_APPLY}

Click Clear Filter
    Click Button    ${BTN_CLEAR_FILTER_MANAGEMENT}

Click Icon Edit
    Hover    ${ACTIONS}
    Click Button    ${VIEW}

Click Back
    Click Button    ${BTN_BACK}

Click Test Tackers
    Hover       ${BTN_TEST_TACKERS}
    Click Button    ${BTN_TEST_TACKERS}
