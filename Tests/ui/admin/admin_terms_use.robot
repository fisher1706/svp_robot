*** Settings ***
Documentation       Test Suite for Terms Of Use

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_terms_use_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability View And Edit Data From Term Of Use Page
    Test Read And Edit Data Term Of Use Page
