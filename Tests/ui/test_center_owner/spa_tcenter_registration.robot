*** Settings ***
Documentation       Registration Test Center Owner to SVP

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_registration_actions.resource
Resource            POM/Keywords/Modules/password_actions.resource
Variables           Resources/Variables/Authentication.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Check receive an invitation email and set password with valid data
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Title Uploaded Files

Check set password with invalid data
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data

C9327 C9328 Check the warning message of password token
    [Documentation]    Check then password can't be set if it had set and can be set if it hasn't been set before
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True    login=False
    Verify Password Validation
