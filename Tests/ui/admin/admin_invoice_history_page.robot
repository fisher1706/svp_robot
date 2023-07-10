*** Settings ***
Documentation       Test Suite for Invoice History Page

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_invoice_history_page_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability Open Invoice History Page Through Navigation Menu
    Test Open Invoice History Page
