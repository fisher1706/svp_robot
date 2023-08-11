*** Settings ***
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Libraries/LocatorFunction.py
Library         Libraries/Utils.py
Variables       POM/Locators/SPALocators.py
Variables       POM/Locators/SPAExamSessionLocators.py
Variables       Resources/Variables/SessionRepeat.py


*** Keywords ***
Click Exam Session
    Click Button    ${BTN_EXAM_SESSION}

Click Add Session
    Click Button    ${BTN_ADD_SESSION}

Choose Time New Session
    [Arguments]     ${time}
    Choose Value With Button    ${TIME_FROM}    ${INPUT_TIME_FROM}      ${time}[2]
    Choose Value With Button    ${TIME_TO}    ${INPUT_TIME_TO}      ${time}[3]

Choose Seats New Session
    [Arguments]     ${seats_number}
    Choose Value With Button    ${SEATS}    ${INPUT_SEATS}      ${seats_number}

Choose Category New Session
    Click Button        ${CHOOSE_CATEGORY}
    Click Button        ${CATEGORY_SESSION}

Choose Repeat Session
    [Arguments]     ${repeat_type}
    IF    '${repeat_type}'=='Does not repeat'
        RETURN
    ELSE
        Click Button    ${REPEAT_SESSION}
        ${locator}=     Create Locator By Span      ${repeat_type}
        Click Button    ${locator}
    END

Click Add Session Form
    Click Button    ${BTN_ADD}

Click Ok
    Click Button    ${BTN_OK}

Click See More
    Click Button        ${SESSION_SEE_MORE}

Choose Custom Repeat Session
    [Arguments]     ${repeat_every}
    IF      '${repeat_every}'!='Day'
        Click Button    ${SELECT_REPEAT_EVERY}
        ${locator}=     Create Locator By Li And Span      ${repeat_every}
        Click Button    ${locator}
        IF     '${repeat_every}'=='Week'
            ${days}=    Get Elements    ${REPEAT_ON}
            FOR    ${day}   IN      @{days}
                Click Button    ${day}
            END

        ELSE IF     '${repeat_every}'=='Month'
            Wait For Elements State    ${MONTH_SELECT_OPTIONS}      visible
            Click Button    ${MONTH_SELECT_OPTIONS}
            Click Button    ${MONTH_SELECTED}
        END
    END

Add Custom Session Day
    [Arguments]    ${num}
    FOR    ${_}      IN RANGE   ${num}
        Click Button    ${BTN_PLUS}
    END

Select Ends Custom
    [Arguments]    ${session_time}      ${ends_on}=True
    ${state_field_on}=   Get Attribute         ${FIELD_INPUT_ON}      disabled     evaluate    value is None
    IF      ${ends_on} and ${state_field_on}
        Type Text    ${FIELD_INPUT_ON}     ${session_time}[-1]
        Click Button    ${REPEAT_SESSION_TEXT}
    ELSE
        Click Button    ${BTN_AFTER}
        Wait For Elements State     ${FIELD_SELECT_AFTER}       enabled
        Click Button    ${FIELD_SELECT_AFTER}
        ${locator}=     Create Locator By Text      ${DEFAULT_SESSION_COUNT}
        Click Button    ${locator}
    END

Click Btn Done
    Click Button    ${BTN_DONE}
