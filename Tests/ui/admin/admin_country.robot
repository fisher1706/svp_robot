*** Settings ***
Documentation       Test Suite for Admin Country

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_country_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability To Create New Country Page
    Test Create New Country

Ability To Edit Country Page By Clicking On Edit Button
    Test Edit Country Page By Edit Button

Ability To Edit Country Page From View Page
    Test Edit Country Page From View Page

Checking Editing For Pass Percentage For Category
    Test Edit Pass Percentage For Category

Checking Not Ability Save Pass Percentage Less Than 50 Per Category
    Test Not Ability Save Pass Percentage Less Than 50 Per Category

Checking Ability Select Nationality For Country
    Test Select Nationality

Check Ability To Filter By Country
    Test Filter By Country

Check Ability To Filter By Legislator
    Test Filter By Legislator

Check Ability To Filter By TCenter
    Test Filter By TCenter
