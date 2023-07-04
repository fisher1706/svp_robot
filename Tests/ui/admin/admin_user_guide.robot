*** Settings ***
Documentation       Test Suite for User Guide

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_user_guide_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Checking Ability Editing User Guide
    Test Edit User Guide

Checking Ability Download User Guide
    Test Download User Guide
