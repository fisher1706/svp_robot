*** Settings ***
Documentation       Test Suite for Individual Registration

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/individual_registration_actions.resource
Variables           POM/Locators/IndividualRegistrationLocators.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Checking Successfully Registration With Email
    Test Successfully Registration With Email