*** Settings ***
Resource        POM/Keywords/Pages/spa_exam_session.resource
Resource        POM/Keywords/Pages/base.resource
Library         Libraries/Utils.py
Variables       POM/Locators/SPAExamSessionLocators.py
Variables       Resources/Variables/SessionRepeat.py
Variables       Resources/Variables/WarningMessage.py


*** Keywords ***
Test Check Ability Add New Session
    Switch To Session
    Click Add Session
    ${session_time}=    Time New Session
    ${seat_number}=     Return Random Number Limit
    ${repeat_type}=   Return Random Data List     ${session_repeat}
    Fill New Session Form   ${session_time}     ${seat_number}      ${repeat_type}
    Click Ok
    Verify Added Session    ${session_time}
    [Return]    ${session_time}     ${seat_number}      ${repeat_type}

Test Not Ability To Create New Session For Past Date
    Switch To Session
    ${session_time}=    Time New Session    session_past=True
    Get Element States    //*[text()="${session_time[1]}"]    validate    value & disabled
    Click Add Session
    Fill New Session Form   ${session_time}     1      Does not repeat
    Verify Text     ${TEXT_ERROR}       ${SESSION_CAN_NOT_BE_PAST}

Test Not Ability Create New Session With Wrong Interval
    Switch To Session
    ${session_time}=    Time New Session    delta=2
    Click Add Session
    Fill New Session Form   ${session_time}     1      Does not repeat
    Verify Text     ${TEXT_ERROR}       ${SESSION_WRONG_INTERVAL}

Test To View Detailed Information About Session
    ${session_time}     ${seat_number}      ${repeat_type}=      Test Check Ability Add New Session
    Click See More
    Verify Additional Information About Session     ${session_time}     ${seat_number}      ${repeat_type}

Test That TCenter Can Not Create Same Session With Same Category Which Starts At The Same Time
    ${session_time}     ${seat_number}      ${repeat_type}=      Test Check Ability Add New Session
    Click Add Session
    Fill New Session Form   ${session_time}     ${seat_number}      ${repeat_type}
    Verify Text     ${TEXT_ERROR}       ${SESSION_HAS_BEEN_TAKEN}

Test That TCenter Can Not Create Same Session With Same Category Which Starts Less Than 30 Min
    ${session_time}     ${seat_number}      ${repeat_type}=      Test Check Ability Add New Session
    ${session_time}=    Time New Session    correct_start=Less
    Click Add Session
    Fill New Session Form   ${session_time}     ${seat_number}      ${repeat_type}
    Verify Text     ${TEXT_ERROR}       ${SESSION_LESS_30_MIN}

Switch To Session
    Wait Spinners To Disappear
    Click Exam Session
    Wait For Elements State     ${EXAM_SESSION_TEXT}   visible

Fill New Session Form
    [Arguments]    ${session_time}      ${seats_number}     ${repeat_type}
    Choose Time New Session     ${session_time}
    Choose Seats New Session        ${seats_number}
    Choose Category New Session
    IF    '${repeat_type}'!='${session_repeat[0]}'     Choose Repeat Session    ${repeat_type}
    Click Add

Verify Added Session
    [Arguments]    ${time}
    Wait For Elements State     ${BTN_ADD}   hidden
    Click       //*[text()="${time[0]}"]
    Verify Text     ${SESSION_CATEGORY}     Engine Mechanics
    Verify Text     ${SESSION_TIME}     ${time[2]} - ${time[3]}
    Verify Text     ${SESSION_STATUS}       Scheduled
    Verify Text     ${SESSION_SEE_MORE}       See more

Verify Additional Information About Session
    [Arguments]    ${session_time}      ${seats_number}     ${repeat_type}
    ${entry}=    Get Last Entry      ${SESSION_ENTRY}
    Should Be True      ${entry}[0]
    Should Be Equal     ${entry}[1]     Engine Mechanics
    Should Be Equal     ${entry}[2]     ${session_time}[4]
    Should Be Equal     ${entry}[3]     120m
    ${seats_number}=    Convert To String   ${seats_number}
    Should Be Equal     ${entry}[4]     ${seats_number}
    Should Be Equal     ${entry}[5]     0
    Should Be Equal     ${entry}[6]     ${repeat_type}
    Should Be Equal     ${entry}[7]     Scheduled
