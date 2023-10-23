*** Settings ***
Documentation       Test Suite for Super Admin

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/super_admin_users_actions.resource
Variables           Resources/Variables/UserInfo.py

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In To The Admin Portal      login=${SUPER_ADMIN}


*** Test Cases ***
Checking Ability To Invite New Admin User To SVP
    Test Add New User To SVP

Checking Ability To Invite New Admin User To SVP With Invalid Email
    Test Add New User To SVP        email=${INVALID_EMAIL}

Checking Ability To Resend The Invitation For Pending Rows
    Test Ability Resend Invitation

Checking Ability To Resend The Invitation For Pending Rows Negative
    Test Ability Resend Invitation      type=negative

Checking Ability To Revoke Admin Users With Activated Statuses
    Skip    Long to find necessary user
    Test Ability Revoke Users With Active Statuses

Checking Ability To Revoke Admin Users With Activated Statuses Negative
    Skip    Long to find necessary user
    Test Ability Revoke Users With Active Statuses      type=negative

Checking Ability To Reactivate Admin Users With Revoked Statuses Negative
    Skip    Long to find necessary user
    Test Ability Reactivate Users With Revoked Statuses     type=negative

Checking Ability To Reactivate Admin Users With Revoked Statuses
    Skip    Long to find necessary user
    Test Ability Reactivate Users With Revoked Statuses

Checking Ability To Edit The Assigned Role for Admin
    Skip    Long to find necessary user
    Test Ability Edit Assigned Role For User
