*** Settings ***
Documentation       Account Information as Legislator

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_account_actions.resource
Resource            POM/Keywords/Pages/spa_upload_files.resource

Test Setup          Open Chrome Browser


*** Test Cases ***
Checking the ability to verify account information
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Account Information

Checking the ability to view account information
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files
    Verify View Account Information

Checking the ability to edit account information with valid data
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files
    Verify Edit Account Information With Valid Data

Checking the ability to edit account information with duplicate email
    Create Entities And Log In
    ...    is_legislator_activate=True
    ...    is_tcenter=True
    ...    is_tcenter_activate=True
    ...    login_tcenter=False
    Verify Title Uploaded Files
    Verify Edit Account Information With Duplicate Email

Checking the ability to edit account information with empty data
    Create Entities And Log In
    ...    is_legislator_activate=True
    ...    is_tcenter=True
    ...    is_tcenter_activate=True
    ...    login_tcenter=False
    Verify Title Uploaded Files
    Verify Edit Account Information With Empty Data

Checking the ability to edit account information with invalid Postal Code field
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files
    Verify Edit Account Information With Invalid Postal Code Field

Checking the ability to edit account information with invalid Name field
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files
    Verify Edit Account Information With Invalid Name Field

Checking the ability to edit account information with invalid Contact Number field
    Skip    issue with warning message
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files
    Verify Edit Account Information With Invalid Contact Number Field

Checking the ability to edit account information with invalid Email Field
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files
    Verify Edit Account Information With Invalid Email Field
