*** Settings ***
Documentation       Registration Legislator to SVP

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_registration_actions.resource
Resource            POM/Keywords/Modules/password_actions.resource
Variables           Resources/Variables/Authentication.py

Test Setup          Open Chrome Browser


*** Test Cases ***
C8804 C8805 Check receive an invitation email and set password with valid data
    Create Entities And Log In    is_legislator_activate=True    login_tcenter=False
    Verify Title Uploaded Files

C8815 Check set password with invalid data
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    is_tcenter=False

C8806 C8807 Check the warning message of password token
    [Documentation]    Check then password can't be set if it had set and can be set if it hasn't been set before
    Create Entities And Log In    is_legislator_activate=True    login=False
    Verify Password Validation
