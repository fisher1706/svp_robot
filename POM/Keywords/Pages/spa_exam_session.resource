*** Settings ***
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/SPAExamSessionLocators.py
Variables       POM/Locators/SPALocators.py


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
    Click Button    ${REPEAT_SESSION}
    Click Button    //span[text()="${repeat_type}"]

Click Add
    Click Button    ${BTN_ADD}

Click Ok
    Click Button    ${BTN_OK}

Click See More
    Click Button        ${SESSION_SEE_MORE}
