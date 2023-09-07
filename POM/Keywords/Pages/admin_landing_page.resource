*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminLandingPageLocators.py


*** Keywords ***
Open Admin Landing Page Content
    Open Page    base_url=${ADMIN_URL}    page_url=landing-page-content

Click Btn Save Changes
    Click Button    ${BTN_SAVE_CHANGES}

Click Btn Ok
    Click Button    ${BTN_OK}

Verify Btn Save Changes Active
    Wait For Elements State    ${BTN_SAVE_CHANGES}      enabled

Activate Field Content
    Click Button    ${ACTIVATE_FIELD_CONTENT}
