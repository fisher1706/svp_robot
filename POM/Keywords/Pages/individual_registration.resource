*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/IndividualRegistrationLocators.py


*** Keywords ***
Open SPA Register Page
    Open Page    base_url=${SPA_URL}    page_url=register