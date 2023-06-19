*** Settings ***
Documentation       Test Suite for Admin Labors Result

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_labors_result_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In By Api To The Admin Portal


*** Test Cases ***
Checking Ability To Download Certificate For Labors Result With Passed Status In The Labor list
    Test Verify Download Certificate    status=Passed

Checking Ability To Download Certificate For Labors Result With Pending Status In The Labor list
    Test Verify Download Certificate    status=Pending

Checking Ability To Download Certificate For Labors Result With Rejected Status In The Labor list
    Test Verify Download Certificate    status=Rejected

Checking Ability To Download Certificate For Labors Result With Failed Status In The Labor list
    Test Verify Download Certificate    status=Failed

Checking Ability To View Labor Details
    Test View Labor Details
