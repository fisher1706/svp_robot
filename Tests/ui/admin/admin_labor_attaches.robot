*** Settings ***
Documentation       Test Suite for Admin Categories

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_labor_attaches_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability To Add The New Attache
    Test Create New Attache

Ability To Add The New Attache For Attached Labor
    Test Create New Attache     success=False

Ability Resend Invitatuion For Attached Labor
    Test Resend Invitation

Checking Ability Search Entry By Filters And Clear Filters
    Test Use Filters
