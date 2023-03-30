*** Settings ***
Documentation       Registration Legislator to SVP

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/password_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/SetPasswordDataset.py

Test Setup          Open Chrome Browser


*** Test Cases ***
C8804 C8805 Check receive an invitation email and set password with valid data
    Create Entities And Log In
    ...    is_legislator_activate=True
    ...    login_tcenter=False
    ...    two_factor_verification=${EMPTY}

C8815 Check set password with invalid data - Empy passwords
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[0]}    is_tcenter=False

C8815 Check set password with invalid data - 8 characters
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[1]}    is_tcenter=False

C8815 Check set password with invalid data - 20 characters
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[2]}    is_tcenter=False

C8815 Check set password with invalid data - Uppercase letter
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[3]}    is_tcenter=False

C8815 Check set password with invalid data - Lowercase letter
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[4]}    is_tcenter=False

C8815 Check set password with invalid data - Number
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[5]}    is_tcenter=False

C8815 Check set password with invalid data - Special character
    Create Entities And Log In    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[6]}    is_tcenter=False

C8806 C8807 Check the warning message of password token
    [Documentation]    Check then password can't be set if it had set and can be set if it hasn't been set before
    Create Entities And Log In    is_legislator_activate=True    login=False
    Verify Password Validation
