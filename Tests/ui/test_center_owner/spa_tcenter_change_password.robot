*** Settings ***
Documentation       Change Password as Test Center Owner

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_change_password_actions.resource
Variables           Resources/Variables/SetPasswordDataset.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Checking the ability to view Change Password form
    Skip    The back button returns to the home page instead of the application page
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify View Change Password Form

Checking the ability to change password
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Change Password

C8839 Check ability to change password with invalid new password - Empy passwords
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Fill Change Password Form    invalid_passwords=${INVALID_PASSWORD_LIST[0]}    is_click=False

C8839 Check ability to change password with invalid new password - 8 characters
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Fill Change Password Form    invalid_passwords=${INVALID_PASSWORD_LIST[1]}    is_click=False

C8839 Check ability to change password with invalid new password - 20 characters
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Fill Change Password Form    invalid_passwords=${INVALID_PASSWORD_LIST[2]}    is_click=False

C8839 Check ability to change password with invalid new password - Uppercase letter
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Fill Change Password Form    invalid_passwords=${INVALID_PASSWORD_LIST[3]}    is_click=False

C8839 Check ability to change password with invalid new password - Lowercase letter
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Fill Change Password Form    invalid_passwords=${INVALID_PASSWORD_LIST[4]}    is_click=False

C8839 Check ability to change password with invalid new password - Number
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Fill Change Password Form    invalid_passwords=${INVALID_PASSWORD_LIST[5]}    is_click=False

C8839 Check ability to change password with invalid new password - Special character
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Fill Change Password Form    invalid_passwords=${INVALID_PASSWORD_LIST[6]}    is_click=False

C8838 Check ability to change password with invalid current password
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Change Password With Invalid Current Password

C8841 Check ability to change password with mismatch "New password"
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Change Password With Mismatch New Password

C8842 Check ability to change password with invalid "confirm password"
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Change Password With Invalid Confirm Password

C8843 Check ability to change password with current Password
    Create Entities And Log In    is_tcenter=True    is_tcenter_activate=True
    Verify Change Password With Current Password
