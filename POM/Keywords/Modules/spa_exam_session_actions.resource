*** Settings ***
Resource        POM/Keywords/Pages/spa_exam_session.resource
Resource        POM/Keywords/Pages/base.resource
Variables       POM/Locators/SPAExamSessionLocators.py
Variables       Resources/Variables/WarningMessage.py


*** Variables ***
${DEFAULT_REPEAT_TYPE}      Does not repeat
${DEFAULT_SEAT_NUMBER}      1
${DEFAULT_STATUS}           Scheduled


*** Keywords ***
Test Check Ability Add New Session
    Ability To Add New Session      random=True

Test Not Ability To Create New Session For Past Date
    [Arguments]    ${start}=//*[text()="    ${end}="]
    Switch To Session
    ${session_time}=    Time New Session    correct_start=True
    ${elements}=    Get Elements    ${start}${session_time[1]}${end}
    Click Add Session
    Fill New Session Form   ${session_time}     ${DEFAULT_SEAT_NUMBER}      ${DEFAULT_REPEAT_TYPE}
    Verify Text     ${TEXT_ERROR}       ${SESSION_CAN_NOT_BE_PAST}

Test Not Ability Create New Session With Wrong Interval
    Switch To Session
    ${session_time}=    Time New Session    delta=2
    Click Add Session
    Fill New Session Form   ${session_time}     ${DEFAULT_SEAT_NUMBER}      ${DEFAULT_REPEAT_TYPE}
    Verify Text     ${TEXT_ERROR}       ${SESSION_WRONG_INTERVAL}

Test To View Detailed Information About Session
    ${session_time}     ${seat_number}      ${repeat_type}=      Ability To Add New Session
    Click See More
    Verify Additional Information About Session     ${session_time}     ${seat_number}      ${repeat_type}

Test That TCenter Can Not Create Same Session With Same Category Which Starts At The Same Time
    ${session_time}     ${seat_number}      ${repeat_type}=      Ability To Add New Session
    Click Add Session
    Fill New Session Form   ${session_time}     ${seat_number}      ${repeat_type}
    Verify Text     ${TEXT_ERROR}       ${SESSION_HAS_BEEN_TAKEN}

Test That TCenter Can Not Create Same Session With Same Category Which Starts Less Than 30 Min
    ${session_time}     ${seat_number}      ${repeat_type}=      Ability To Add New Session
    ${session_time}=    Time New Session    correct_start=Less
    Click Add Session
    Fill New Session Form   ${session_time}     ${seat_number}      ${repeat_type}
    Verify Text     ${TEXT_ERROR}       ${SESSION_LESS_30_MIN}

Ability To Add New Session
    [Arguments]    ${num}=1     ${random}=False
    Switch To Session
    Click Add Session
    ${session_time}=    Time New Session
    ${seat_number}=     Return Random Number Limit
    ${repeat_types}=     Get Last Entry    ${TYPES_REPEAT_SESSION}
    IF    ${random}
        ${repeat_type}=   Return Random Data List     ${repeat_types}
    ELSE
        ${repeat_type}=   Set Variable    ${repeat_types}[0]
    END
    Fill New Session Form   ${session_time}     ${seat_number}      ${repeat_type}
    Click Ok
    Verify Added Session    ${session_time}
    [Return]    ${session_time}     ${seat_number}      ${repeat_type}

Switch To Session
    Wait Spinners To Disappear
    Click Exam Session
    Wait For Elements State     ${EXAM_SESSION_TEXT}   visible

Fill New Session Form
    [Arguments]    ${session_time}      ${seats_number}     ${repeat_type}
    Choose Time New Session     ${session_time}
    Choose Seats New Session        ${seats_number}
    Choose Category New Session
    Choose Repeat Session    ${repeat_type}
    IF      '${repeat_type}'=='Custom'
        Fill Custom Session Form    session_time=${session_time}
    ELSE
        Click Add Session Form
    END

Verify Added Session
    [Arguments]    ${time}      ${start}=//*[text()="        ${end}="]
    Wait For Elements State     ${BTN_ADD}   hidden
    ${elements}=     Get Elements        ${start}${time[0]}${end}
    ${day}=      Get Day     ${time}     0
    Click       ${day}
    Verify Text     ${SESSION_CATEGORY}     Engine Mechanics
    TRY
        Verify Text     ${SESSION_TIME}     ${time[2]} - ${time[3]}
    EXCEPT
        ${data}=    Get Text        ${SESSION_TIME}
        Should Not Be Empty    ${data}
    END
    Verify Text     ${SESSION_STATUS}       ${DEFAULT_STATUS}
    Verify Text     ${SESSION_SEE_MORE}       See more

Verify Additional Information About Session
    [Arguments]    ${session_time}      ${seats_number}     ${repeat_type}
    ${entry}=    Get Last Entry      ${SESSION_ENTRY}
    Should Be True      ${entry}[0]
    Should Be Equal     ${entry}[1]     Engine Mechanics
    Should Be String    ${entry}[2]
    Should Be Equal     ${entry}[3]     120m
    ${seats_number}=    Convert To String   ${seats_number}
    Should Be Equal     ${entry}[4]     ${seats_number}
    Should Be Equal     ${entry}[5]     0
    Should Be Equal     ${entry}[6]     ${repeat_type}
    Should Be Equal     ${entry}[7]     ${DEFAULT_STATUS}

Get Day
    [Arguments]    ${time}      ${index}
    @{elements}=     Get Elements        //*[text()="${time}[${index}]"]
    FOR    ${el}    IN      @{elements}
        ${state}=    Get Attribute         ${el}       aria-disabled
        IF      '${state}'=='false'     RETURN    ${el}
    END

Fill Custom Session Form
    [Arguments]    ${session_time}      ${num}=1
    Wait For Elements State    ${REPEAT_SESSION_TEXT}
    ${repeat_every}=   Return Random Data List     ${custom_repeat}
    Choose Custom Repeat Session        repeat_every=${repeat_every}
    Add Custom Session Day      num=${num}
    Select Ends Custom      session_time=${session_time}
    Click Btn Done
