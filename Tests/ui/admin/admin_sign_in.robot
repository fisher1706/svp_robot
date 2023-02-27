*** Settings ***
Documentation           Test Suite for Admin Log In
Resource    ../../../Resources/Setup/webdriver_manager.robot
Resource    ../../../POM/Keywords/Modules/login_actions.resource
Resource    ../../../POM/Keywords/Modules/dashboard_actions.resource
Library     ../../../POM/Keywords/Modules/LoginActions.py

Test Setup    Open Chrome Browser

*** Test Cases ***
Test C6248 Check valid Login and Password
    Log in to the Admin portal
    Verify Admin Confirm Code
    Proceed 2fa
    Verify Admin Dashboard Welcome Text

Test C6249 Check invalid login and password
    Skip    todo

Test C6250 Check log in without entering email and password
    Skip    todo
