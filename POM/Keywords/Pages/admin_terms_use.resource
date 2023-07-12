*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminTermsUseLocators.py


*** Keywords ***
Open Admin Terms Use Content
    Open Page    base_url=${ADMIN_URL}    page_url=terms-of-use-page-content

Click Btn Arabic
    Click Button    ${BTN_ARABIC}

Click Btn Edit
    Click Button    ${BTN_EDIT}

Click Btn Save
    Click Button    ${BTN_SAVE}

Click Btn Ok
    Click Button    ${BTN_OK}
