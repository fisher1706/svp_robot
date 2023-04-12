*** Settings ***
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Pages/spa_upload.resource
Variables       POM/Locators/SPALaborLocators.py


*** Keywords ***
Click Labors
    Click Button    ${BTN_LABORS}

Clik On Email Field
    Click Button        ${EDIT_EMAIL_FIELD}

Fill Labor Email
    [Arguments]    ${email}
    Wait For Elements State    ${FIELD_POPUP_EMAIL}    state=visible
    Type Text   ${FIELD_POPUP_EMAIL}   ${email}

Click Save Email
    Click Button    ${BTN_SAVE_EMAIL}

Click Next Labor
    Click Button    ${BTN_NEXT}

Verify Search Result Value
    [Arguments]    ${amount}
    Verify Text        ${VALUE_SEARCH_RESULT}       ${amount}     is_equal=False

Verify National Id
    [Arguments]    ${val}
    Fill Filter Field   ${NATIONAL_ID}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Labor Name
    [Arguments]    ${val}
    Fill Filter Field   ${LABOR_NAME}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Passport Number
    [Arguments]    ${val}
    Fill Filter Field   ${PASSPORT_NUMBER}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Email
    [Arguments]    ${val}
    Fill Filter Field   ${EMAIL}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Category
    [Arguments]    ${val}     ${attr}=text
    Click Button    ${CATEGORY_LABOR}
    Select Options By    ${CATEGORY_LABOR}    ${attr}    ${val}
    Keyboard Key    press    Enter
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify TCenter
    [Arguments]    ${val}     ${attr}=text
    Click Button    ${TEST_CENTER}
    Select Options By    ${TEST_CENTER}    ${attr}    ${val}
    Keyboard Key    press    Enter
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Exam Date
    [Arguments]    ${val}
    Fill Filter Field   ${EXAM_DATE}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Exam Result
    [Arguments]    ${val}     ${attr}=text
    Click Button    ${EXAM_RESULT}
    Select Options By    ${EXAM_RESULT}    ${attr}    ${val}
    Keyboard Key    press    Enter
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Fill Filter Field
    [Arguments]    ${locator}       ${val}
    Type Text    ${locator}     ${val}
