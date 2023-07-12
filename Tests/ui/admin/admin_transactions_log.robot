*** Settings ***
Documentation       Test Suite for Transactions Log Page

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_transactions_log_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability Open Transactions Logs Page Through Navigation Menu
    Test Open Transactions Log Page

Checking Ability Search Entry By Filters And Clear Filters On Transactions Log Page
    Test Use Filter On Transactions Log Page
