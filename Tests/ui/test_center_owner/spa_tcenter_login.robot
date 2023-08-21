*** Settings ***
Documentation       Registration Test Center Owner to SVP

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Pages/spa_upload_files.resource
Variables           Resources/Variables/Authentication.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Check valid Login and Password 2fa via email
    Skip    Can not possibility get email from email service
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True    two_factor_verification=${AUTH_EMAIL}
    Verify Title Uploaded Files

C8819 Check valid Login and Password
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Title Uploaded Files

C8840 Check ability to log out from system
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Log Out User

Checking Password Validation For TCenter Reset Password Flow With Invalid User Email
    Ability Reset Password

Checking Password Validation For TCenter Reset Password Flow With Invalid Credentials
    [Documentation]    Only negative flow. Positive use in "Create Entities And Log In"
    Create Entities And Reset Password With Invalid Credentials    is_tcenter=True    is_tcenter_activate=True
