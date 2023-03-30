*** Settings ***
Documentation       Registration Test Center Owner to SVP

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/password_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           POM/Keywords/Modules/password_actions.resource

Test Setup          Open Chrome Browser


*** Test Cases ***
Check receive an invitation email and set password with valid data
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True    two_factor_verification=${EMPTY}

Check set password with invalid data - Empy passwords
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[0]}

Check set password with invalid data - 8 characters
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[1]}

Check set password with invalid data - 20 characters
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[2]}

Check set password with invalid data - Uppercase letter
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[3]}

Check set password with invalid data - Lowercase letter
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[4]}

Check set password with invalid data - Number
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[5]}

Check set password with invalid data - Special character
    Create Entities And Log In    is_tcenter=True    login=False
    Verify Password With Invalid Data    invalid_passwords=${INVALID_PASSWORD_LIST[6]}

C9327 C9328 Check the warning message of password token
    [Documentation]    Check then password can't be set if it had set and can be set if it hasn't been set before
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True    login=False
    Verify Password Validation
