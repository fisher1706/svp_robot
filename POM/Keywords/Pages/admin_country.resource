*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminCountryLocators.py


*** Keywords ***
Open Admin Country Page
    Open Page    base_url=${ADMIN_URL}    page_url=country-settings

Click New Country
    Click Button        ${BTN_NEW_COUNTRY}

Select Country
    [Arguments]    ${selector}      ${val}=1     ${attr}=index
    Click Button    ${selector}
    Select Options By    ${selector}    ${attr}    ${val}
    Keyboard Key    press    Enter

Click Btn Add
    Click Button    ${BTN_ADD}


