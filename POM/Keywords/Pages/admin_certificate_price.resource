*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminCertificatePriceLocators.py


*** Keywords ***
Open Admin Certificate Price Page
    Open Page    base_url=${ADMIN_URL}    page_url=certificate-price

Click Btn Edit
    Click Button    ${BTN_EDIT}

Click Btn Save
    Click Button    ${BTN_SAVE}

Click Btn Confirm
    Click Button    ${BTN_CONFIRM}
