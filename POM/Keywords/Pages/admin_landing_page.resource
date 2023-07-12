*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminLandingPageLocators.py


*** Keywords ***
Open Admin Landing Page Content
    Open Page    base_url=${ADMIN_URL}    page_url=landing-page-content

Click Btn Edit
    Click Button    ${BTN_EDIT}

Click Btn Save
    Click Button    ${BTN_SAVE}

Click Btn Ok
    Click Button    ${BTN_OK}
