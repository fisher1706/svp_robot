*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminCertificateBalanceLocators.py


*** Keywords ***
Open Admin Certificate Balance Page
    Open Page    base_url=${ADMIN_URL}    page_url=certificate-balance

Click Btn Cancel
    Click Button    ${BTN_CANCEL}

Click Btn Seach
    Click Button    ${BTN_SEARCH}
