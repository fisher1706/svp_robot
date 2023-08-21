*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_exam_session_actions.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True


*** Test Cases ***
Checking ability to add new session
    Test Check Ability Add New Session      random=True

Checking not ability to create a new session for past date
    Test Not Ability To Create New Session For Past Date

Checking not ability to create a new sessions with wrong interval
    Test Not Ability Create New Session With Wrong Interval

Checking ability to view detailed information about the future session via See more button
    Test To View Detailed Information About Session

Checking that TCenter can not create same session with the same category which starts at the same time
    Test That TCenter Can Not Create Same Session With Same Category Which Starts At The Same Time

Checking that a TCenter can not create same session with the same category which starts with less than 30 min
    Test That TCenter Can Not Create Same Session With Same Category Which Starts Less Than 30 Min
