*** Settings ***
Documentation       Test Suite for Admin Log Page

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_log_page_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability Open Action Logs Page Through Navigation Menu
    Test Open Actions Log Page

Checking Ability Search Entry By Filters And Clear Filters On Log Page
    Test Use Filter On Log Page
