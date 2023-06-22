*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminCountryLocators.py


*** Keywords ***
Open Admin Country Page
    Open Page    base_url=${ADMIN_URL}    page_url=country-settings

Click New Country
    Click Button        ${BTN_NEW_COUNTRY}
