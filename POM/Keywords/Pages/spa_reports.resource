*** Settings ***
Library         Browser
Library         Libraries/Utils.py
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/SPAReportsLocator.py


*** Keywords ***
Click Reports
    Click Button    ${BTN_REPORTS}

Verify Field Id
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_FIELD_ID}     ${val}
    Verify Text     ${FIELD_ID}      ${val}

Verify Field Group No
    [Arguments]    ${val}
    Fill Filter Field    ${FILTER_FIELD_GROUP_NO}      ${val}
    Verify Text     ${FIELD_GROUP_NO}      ${val}

Verify Field Amount
    [Arguments]    ${val}
    Fill Filter Field    ${FILTER_FIELD_AMOUNT}    ${val}
    Verify Text     ${FIELD_AMOUNT}      ${val}

Verify Field Date
    [Arguments]    ${val}
    ${date}=    Reformat Date       ${val}
    Fill Filter Field    ${FILTER_FIELD_DATE}      ${date}
    Verify Text     ${FIELD_DATE}      ${val}

Verify Field Status
    [Arguments]    ${val}
    Verify Text     ${FIELD_STATUS}     ${val}

Click Check Validity
    Click Button        ${BTN_CHECK_VALIDITY}

Fill Passport Number
    [Arguments]     ${passport}
    Type Text       ${FIELD_PASSPORT_NUMBER}        ${passport}

Fill Sertificate Serial Number
    [Arguments]    ${certificate}
    Type Text       ${FIELD_CERTIFICATE_SERIAL_NUMBER}      ${certificate}

Click Verify
    Click Button    ${BTN_VERIFY}

Check Verify Status
    [Arguments]    ${status}
    Wait For Elements State    ${BTN_VERIFY}    ${status}

Verify Msg Sertificates
    [Arguments]     ${val}
    Verify Text     ${MSG_VALID_CERTIFICATE}      ${val}

Verify Result Passport Number
    [Arguments]     ${val}
    Verify Text     ${RESULT_PASSPORT_NUMBER}      ${val}       is_equal=False

Verify Result Certificate Serial Number
    [Arguments]     ${val}
    Verify Text     ${RESULT_CERTIFICATE_SERIAL_NUMBER}      ${val}     is_equal=False

Verify Labor Name
    [Arguments]     ${val}=Name
    Verify Text     ${LABOR_NAME}      ${val}

Verify Passport Number
    [Arguments]     ${val}
    Verify Text     ${PASSPORT_NUMBER}      ${val}      is_equal=False

Click Icon Certificate
    Click Button    ${ICON_CERTIFICATES}

Click Actions
    Click Button    ${ACTIONS}

Click Icon Report
    Click Button    ${ICON_REPORT}
