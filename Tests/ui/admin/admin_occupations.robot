*** Settings ***
Documentation       Test Suite for Admin Occupation

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_occupations_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Checking Adding New Occupation
    Test Add New Occupation

Checking Ability To Download All Occupations List
    Test Download All Occupations List

Checking Ability To Upload Occupations
    Test Upload Occupation

Checking Ability To Upload Occupations With Already Existing Data
    Test Upload Occupation      new=False

Checking Error Message If Admin Try To Add Occupation With Existed Key
    Test Add Occupation With Existed Key

Checking that Name (Ar - En) Can Be Duplicated
    Test Add Occupation With Existed Name

Checking Allow Entering Special Char In The (Ar - En) Name Fields
    Test Add Occupation With Special Char In Name Field
