*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_assessors_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Create Entities And Log In
...     is_legislator_activate=True
...     login_tcenter=False
...     is_tcenter=True


*** Test Cases ***
Checking Ability To View Basic Information
    Test Ability View Basic Information

Checking Ability To View Additional Information And Return To Assessors
    Test Ability View Additional Information And Return To Assessors

Checking Ability To Download Attached Files
    Test Ability Download Attached Files

Checking Ability To Select A Filter
    Test Ability Select Filter
