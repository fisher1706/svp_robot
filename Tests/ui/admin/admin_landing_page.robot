*** Settings ***
Documentation       Test Suite for Landing Page Content

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_landing_page_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability Edit Landing Page Content
    Test Edit Landing Page Content
