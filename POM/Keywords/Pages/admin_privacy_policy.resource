*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminPrivacyPolicyLocators.py


*** Keywords ***
Open Admin Privacy Policy Content
    Open Page    base_url=${ADMIN_URL}    page_url=privacy-page-content

Activate Field Content
    Click Button    ${ACTIVATE_FIELD_CONTENT}

Verify Btn Save Changes Active
    Wait For Elements State    ${BTN_SAVE_CHANGES}      enabled
