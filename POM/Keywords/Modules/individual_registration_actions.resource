*** Settings ***
Resource            POM/Keywords/Pages/individual_registration.resource
Variables           POM/Locators/IndividualRegistrationLocators.py


*** Keywords ***
Test Successfully Registration With Email
    Open SPA Register Page