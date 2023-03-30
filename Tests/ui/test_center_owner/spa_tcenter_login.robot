*** Settings ***
Documentation       Registration Test Center Owner to SVP

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_registration_actions.resource
Variables           Resources/Variables/Authentication.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Check valid Login and Password 2fa via email
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True    two_factor_verification=${AUTH_EMAIL}
    Verify Title Uploaded Files

C8819 Check valid Login and Password
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Title Uploaded Files

C8840 Check ability to log out from system
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Log Out User
