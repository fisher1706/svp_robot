*** Settings ***
Documentation           Test Suite for Admin Log In
Resource    Resources/Setup/webdriver_manager.resource
Resource    POM/Keywords/Modules/login_actions.resource
Resource    POM/Keywords/Modules/admin_actions.resource
Variables   Resources/Variables/Titles.py

Test Setup    Open Chrome Browser


*** Test Cases ***
Check ability to add New Legislator with valid data
    Log In By Api To The Admin Portal
    Register New Legislator
