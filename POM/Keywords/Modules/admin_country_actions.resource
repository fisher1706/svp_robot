*** Settings ***
Resource        POM/Keywords/Pages/admin_country.resource
Resource        POM/Keywords/Pages/base.resource
Variables       POM/Locators/AdminCountryLocators.py


*** Keywords ***
Test Create New Country
    Admin Country Actions
    Click New Country
    Wait Spinners To Disappear      ${NEW_COUNTRY}      visible








Admin Country Actions
    Open Admin Country Page
    Wait Spinners To Disappear
    Wait For Elements State     ${PERMITTED_SERVICES}       visible