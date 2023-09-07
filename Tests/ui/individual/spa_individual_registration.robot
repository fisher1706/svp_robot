*** Settings ***
Documentation       Test Suite for Individual Registration

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/individual_registration_actions.resource
Variables           POM/Locators/IndividualRegistrationLocators.py
Variables           Resources/Variables/IndividualTestData.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Checking Validation Rules For The First Step
    Test Successfully Registration

Checking Error Message For National ID Which Already Exists In DB
    Test Verify Error Messages Individual Registration      national_id=${REGISTERED_NATIONAL_ID}

Checking Error Message For Email Which Already Exists In DB
    Test Verify Error Messages Individual Registration      email=${REGISTERED_EMAIL}

Checking Error Message For Passport Number Which Already Exists In DB
    Test Verify Error Messages Individual Registration      passport_number=${REGISTERED_PASSPORT_NUMBER}

Checking Email Validation On The First Step
    Test Verify Warning Messages Individual Registration    email=${WRONG_EMAIL}

Checking That Individual Is Able To Interrupt Registration Flow
    Test Ability Interrupt Registration

Checking That Individual Can't Type More Than 50 Characters In First Name And Last Name Fields
    Test Verify Warning Messages Individual Registration
    ...     first_name=${LONG_FIRST_NAME}
    ...     last_name=${LONG_LAST_NAME}
