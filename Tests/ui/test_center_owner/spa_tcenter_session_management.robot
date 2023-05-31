*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_session_management_actions.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True


*** Test Cases ***
Checking that The test center will be able to view all sessions
    Test TCcenter Will Be Able To View All Sessions

Checking the operations of filters search by non existed data
    Test Filters By Non Existent Data

Checking ability to use view action to see sessions Information
    Test Ability To Use View Action To See Sessions Information

Checking Information for Canceled session
    Skip    todo after add functionality

Checking ability to back from the Session Informations Page
    Test Ability To Back From Session Information Page

Checking Test Takers Table with no result
    Test Checking Tackers Table With No Result

Checking that TCenter is able to use the Assigned assessor filter
    Test TCenter Is Able To Use Filter
