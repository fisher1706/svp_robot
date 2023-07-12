*** Settings ***
Documentation       Test Suite for Certificate Balance Page

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_certificate_balance_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Checking Ability Search Entry By Filters And Clear Filters On Certificate Balance Page
    Test Use Filter On Certificate Balance Page
