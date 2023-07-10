*** Settings ***
Documentation       Test Suite for Admin Categories

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_categories_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Ability To Add The Category
    Test Ability Add Category

Adding The Category With Incorrect Data
    Test Add Category With Incorrect Data

Adding The Category With Empty Form
    Test Add Category With Empty Form

Ability To Edit The Category
    Test Ability To Edit Category

Ability To View Category Details Information
    Test View Category Detail Information

Ability To View Category History
    Test View Category History

Ability To Change Status Of The Category
    Skip    discuss change status
    Test Change Category Status

Uploading Of The Category From Csv File
    Test Upload Category From Csv

Uploading Existing Categories From Csv File
    Test Upload Category From Csv   is_correct=False

Ability To Download Csv Sample File
    Test Download Csv Sample
