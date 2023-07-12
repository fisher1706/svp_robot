*** Settings ***
Documentation       Test Suite for Privacy Policy

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_privacy_policy_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability View And Edit Data From Privacy Policy Page
    Test Read And Edit Data Privacy Policy Page
