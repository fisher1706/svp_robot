*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Resource            POM/Keywords/Modules/spa_actions.resource
Variables           POM/Locators/SPAStartExamLocators.py
Variables           Resources/Variables/ErrorMessage.py


*** Keywords ***
Open Admin SVPI Reservations Page
    Open Page    base_url=${ADMIN_URL}    page_url=reservations

Click Icon View
    [Arguments]    ${icon_actios}     ${icon_view}
    Hover    ${icon_actios}
    Click Button    ${icon_view}

Click Btn Start Exam
    Click Button    ${BTN_START_EXAM}

Click Btn Check
    Click Button    ${BTN_CHECK}

Click Btn Next
    Click Button    ${BTN_NEXT_EXAM}

Check Agreement
    Check Checkbox    ${AGREEMENT}

Verify Btn Start Exam
    [Arguments]     ${agreement}
    IF      ${agreement}
        Wait For Elements State    ${BTN_START_EXAM_TERMS}      enabled
    ELSE
        Wait For Elements State    ${BTN_START_EXAM_TERMS}      disabled
    END

Fill Test Tacker & Exam Info
    [Arguments]    ${entry}     ${passport}        ${reservation}
    IF    '${passport}'=='${EMPTY}' and '${reservation}'=='${EMPTY}'
        Type Text    ${FIELD_PASSPORT_NUMBER}   ${entry}[2]
        Type Text    ${FIELD_RESERVATION_NUMBER}   ${entry}[11]
    ELSE IF    '${passport}'!='${EMPTY}' and '${reservation}'=='${EMPTY}'
        Type Text    ${FIELD_PASSPORT_NUMBER}       ${passport}
        Type Text    ${FIELD_RESERVATION_NUMBER}   ${entry}[11]
    ELSE IF     '${passport}'=='${EMPTY}' and '${reservation}'!='${EMPTY}'
        Type Text    ${FIELD_PASSPORT_NUMBER}   ${entry}[2]
        Type Text    ${FIELD_RESERVATION_NUMBER}   ${reservation}
    ELSE
        Type Text    ${FIELD_PASSPORT_NUMBER}       ${passport}
        Type Text    ${FIELD_RESERVATION_NUMBER}   ${reservation}
    END
    Click Btn Check

Verify Test Tacker & Exam Info
    [Arguments]    ${passport}        ${reservation}
    IF    '${passport}'=='${EMPTY}' and '${reservation}'=='${EMPTY}'
        ${data_taker_info}=     Get Last Entry    ${ENTRY_INFO}
        Should Not Be Empty    ${data_taker_info}
        Click Btn Next
    ELSE
        Verify Reservation Error
    END

Verify Term And Conditions
    [Arguments]    ${agreement}
    Wait For Elements State    ${TERMS_AND_CONDITIONS_TEXT}     visible
    ${data_term_and_conditions}=    Get Last Entry    ${ENTRY_TERMS_AND_CONDITIONS}
    Should Not Be Empty    ${data_term_and_conditions}
    IF      ${agreement}
        Check Agreement
        Verify Btn Start Exam       agreement=${agreement}
    ELSE
        Verify Btn Start Exam       agreement=${agreement}
    END

Verify Reservation Error
    Verify Text    ${RESERVATION_ERROR}     ${MSG_RESERVATION_ERROR}
