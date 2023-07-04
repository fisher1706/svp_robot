*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Variables           POM/Locators/AdminPrivacyPolicyLocators.py


*** Keywords ***
Open Admin Privacy Policy Content
    Open Page    base_url=${ADMIN_URL}    page_url=privacy-page-content

Verify Edit Button Status
    Wait For Elements State    ${BTN_EDIT}    enabled
