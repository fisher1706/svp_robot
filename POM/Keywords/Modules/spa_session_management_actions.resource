*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Resource        POM/Keywords/Modules/spa_exam_session_actions.resource
Resource        POM/Keywords/Pages/spa_session_management.resource
Library         Libraries/Utils.py
Variables       POM/Locators/SPASessionManagementLocators.py
Variables       Resources/Variables/InfoMessages.py
Variables       Resources/Variables/Filters.py


*** Variables ***
${DEFAULT_REPEAT_TYPE}      Does not repeat


*** Keywords ***
Test TCcenter Will Be Able To View All Sessions
    [Arguments]    ${number}=3
    ${total_data}=     Create List
    Switch To Session
    FOR    ${i}    IN RANGE    0    ${number}   3
        Click Add Session
        ${session_time}=    Time New Session    num=${i}
        ${seat_number}=     Return Random Number Limit
        ${repeat_type}=   Set Variable      ${DEFAULT_REPEAT_TYPE}
        Fill New Session Form   ${session_time}     ${seat_number}      ${repeat_type}
        Click Ok
        ${seat_number}=     Convert To String       ${seat_number}
        ${repeat_type}=     Convert To String       ${repeat_type}
        ${repeat_type}=     Cap String      ${repeat_type}
        Append To List      ${total_data}      ${session_time[4]}     ${seat_number}      ${repeat_type}
    END
    Switch To Session Management
    Wait Until Keyword Succeeds    5x    2 sec
    ...     Wait For Elements State     //*[text()=" ${session_time[4]} "]   visible
    Verify Added Sessions   ${total_data}

Test Filters By Non Existent Data
    Test Check Ability Add New Session
    Switch To Session Management
    ${elements}=    Get Elements    ${TYPE}
    Verify Filter Session ID    test    False
    Verify Filter Seats    ${EMPTY}      100   False
    Verify Filter Session Date      ${WRONG_SESSION_DATE}   False

Test Ability To Use View Action To See Sessions Information
    ${session_time}     ${seat_number}      ${repeat_type}=     Test Check Ability Add New Session
    Switch To Session Management
    Click Icon Edit
    Verify Additional Information About Session     ${session_time}     ${seat_number}      ${repeat_type}

Test Ability To Back From Session Information Page
    Test Ability To Use View Action To See Sessions Information
    Wait For Elements State     ${SESSION_MANAGEMENT_TEXT}   visible
    Verify Text     ${SESSION_MANAGEMENT_TEXT}      Sessions Management     timeout=60s

Test Checking Tackers Table With No Result
    Test Ability To Use View Action To See Sessions Information
    Click Test Tackers
    Wait For Elements State     ${TEST_TACKERS_TEXT}   visible
    TRY
        Verify Text     ${EMPTY_TEST_TACKERS_DATA}      ${NO_DATA_AVAILABLE}
    EXCEPT
        Verify Text     ${EMPTY_TEST_TACKERS_DATA}      ${NO_DATA_AVAILABLE}
    END

Test TCenter Is Able To Use Filter
    ${interval}=     Get Month Interval
    Test TCcenter Will Be Able To View All Sessions
    ${data}=    Read Tabs Data Session Management   ${ENTRY}    True
    Verify Filter Session ID    ${data[0][0]}       True
    Verify Filter Session Date      ${interval}     True

Verify Filter Session ID
    [Arguments]    ${data}      ${is_correct}
    Switch And Clear Filters
    Type Text       ${SESSION_ID}       ${data}
    Click Apply
    IF      ${is_correct}
        Verify Text     ${CHOSE_FILTERS}      ${data}
    ELSE
        Verify Text     ${NO_DATA}      ${NO_DATA_AVAILABLE}
    END

Verify Filter Seats
    [Arguments]    ${locator}      ${data}     ${is_correct}
    Switch And Clear Filters
    Type Text   ${SEATS_INPUT}      ${data}
    IF    ${is_correct}
        Verify Text     ${CHOSE_FILTERS}      ${data}
    ELSE
        Verify Text     ${NO_DATA}      ${NO_DATA_AVAILABLE}
    END

Verify Filter Reservations
    [Arguments]    ${locator}   ${data}     ${is_correct}
    Switch And Clear Filters
    Type Text   ${RESERVATION_INPUT}      ${data}
    Click Apply
    IF    ${is_correct}
        RETURN
    ELSE
        Verify Text     ${NO_DATA}      ${NO_DATA_AVAILABLE}
    END

Verify Filter Session Date
    [Arguments]    ${data}     ${is_correct}
    Switch And Clear Filters
    Type Text   ${SESSION_DATE_FROM}      ${data[0]}
    Type Text   ${SESSION_DATE_TO}      ${data[1]}
    Keyboard Key    press    Enter
    IF    ${is_correct}
        ${filters_data}=    Get Last Entry      ${CHOSE_FILTERS}
        Lists Should Be Equal       ${data}     ${filters_data}
    ELSE
        Verify Text     ${NO_DATA}      ${NO_DATA_AVAILABLE}        timeout=60s
    END

Switch To Session Management
    Wait Spinners To Disappear
    Click Session Management
    Wait For Elements State     ${SESSION_MANAGEMENT_TEXT}   visible

Switch And Clear Filters
    Click Button    ${FILTER_ICON}
    Wait For Elements State    ${BTN_APPLY}     visible
    Click Clear Filter

Verify Added Sessions
    [Arguments]     ${data_in}
    ${data}=     Read Tabs Data Session Management      ${ENTRY}
    Lists Should Be Equal     ${data_in}     ${data}

Read Tabs Data Session Management
    [Arguments]    ${locators}      ${all_data}=False
    ${final}=   Create List
    ${rowList}=   Get Last Entry      ${locators}
    FOR    ${i}     IN      @{rowList}
        @{inner}=       Split String    ${i}    \t
        IF      ${all_data}
            Append To List      ${final}    ${inner}
        ELSE
            Append To List      ${final}    ${inner}[3]     ${inner}[5]     ${inner}[7]
        END
    END
    [Return]    ${final}
