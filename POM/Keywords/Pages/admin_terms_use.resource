*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminTermsUseLocators.py


*** Keywords ***
Open Admin Terms Use Content
    Open Page    base_url=${ADMIN_URL}    page_url=terms-of-use-page-content

Click Btn Arabic
    Click Button    ${BTN_ARABIC}

Click Btn Save Changes
    Click Button    ${BTN_SAVE_CHANGES}

Click Btn Ok
    Click Button    ${BTN_OK}

Verify Btn Save Changes Active
    Wait For Elements State    ${BTN_SAVE_CHANGES}      enabled

Activate Field Content
    Click Button    ${ACTIVATE_FIELD_CONTENT}
