*** Settings ***
Documentation       Test Suite for Admin Labors

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_labors_actgions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Checking Ability To See The Labors Page
    Test Switch To Labors Page

Checking Ability To Use View Action For Active Labor
    Test Use View Actions Active Labor

Checking Ability To Revoke Labor On The Labor Page
    Test Revoke Labor On The Labor Page

Checking Ability To Use View Action For Revoked Labor
    Test Use View Actions Revoked Labor

Checking Ability To Activate Labor On The Labor Page
    Test Ability Activate Labor On Labor Page

Checking Ability To Back From The View Labor Page
    Test Ability To Back From View Labor Page

Checking The Ability To View Certificates Page
    Test Ability View Certificates Page

Checking Ability To Use Filtration To See Labors Results
    Test Ability Use Filtration
