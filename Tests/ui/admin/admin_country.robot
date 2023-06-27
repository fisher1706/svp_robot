*** Settings ***
Documentation       Test Suite for Admin Country

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_country_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Abitity To Create New Country Page
    Test Create New Country

Ability To Edit Country Page By Clickin On Edit Button
    Test Edit Country Page By Edit Button
