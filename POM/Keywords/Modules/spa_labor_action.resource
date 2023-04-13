*** Settings ***
Resource        POM/Keywords/Pages/spa_labor.resource
Resource        POM/Keywords/Modules/spa_upload_actions.resource
Library         Resources/DataSources/models/ModelBuilder.py
Variables       Resources/Variables/dataset.py
Variables       Resources/Variables/ErrorMessage.py
Variables       Resources/Variables/WarningMessage.py


*** Variables ***
${AMOUNT}       11
@{LIST_EXAM_RESULTS}    PASSED      FAILED      PENDING     REJECTED


*** Keywords ***
Test Legislator Validation Edit Email On Labors Tab
    ${tect_center}     ${occupation}     Add TCentr
    Upload Group Of Labors      ${tect_center}     ${occupation}
    Verify Validation Edit Email On Labors Tab

Test Legislator Edit Email On Labors Tab
    ${tect_center}     ${occupation}     Add TCentr
    Upload Group Of Labors      ${tect_center}     ${occupation}
    Edit And Verify Email

Test Legislator Pagination And Search Result Value
    ${tect_center}     ${occupation}     Add TCentr
    FOR    ${_}    IN RANGE    ${AMOUNT}
        Upload Group Of Labors      ${tect_center}     ${occupation}
    END
    Click Next Labor
    Verify Search Result Value      ${AMOUNT}

Test Legislator All Count On Labors Tab
    ${tect_center}     ${occupation}     Add TCentr
    Upload Group Of Labors      ${tect_center}     ${occupation}
    Click Labors
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Verify Search Result Value      amount=1
    Click Uploaded Files
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     visible
    Upload Group Of Labors      ${tect_center}     ${occupation}
    Click Labors
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Verify Search Result Value      amount=2

Test Legislator Search Entry By Filters On Labors Table
    ${tect_center}     ${occupation}     Add TCentr
    Upload Group Of Labors      ${tect_center}     ${occupation}    amount=1
    Click Labors
    Wait For Elements State     ${EDIT_EMAIL_FIELD}      enabled
    ${elements}    Get Last Entry    ${LAST_ENTRY}
    Verify National Id      ${elements}[0]
    Verify Labor Name       ${elements}[1]
    Verify Passport Number       ${elements}[2]
    Verify Email       ${elements}[3]
    Verify Category       ${elements}[4]
    Verify TCenter      ${elements}[5]
    Verify Exam Date        ${elements}[6]
    Verify Exam Result      ${elements}[7]

Test Legislator Counts On Labors Tab
    ${tect_center}     ${occupation}     Add TCentr
    FOR    ${result}    IN      @{LIST_EXAM_RESULTS}
        IF    '${result}'=='PASSED'
            Upload Group Of Labors      ${tect_center}     ${occupation}    wrong_timestamp=previous
        ELSE IF     '${result}'=='FAILED'
            Upload Group Of Labors      ${tect_center}     ${occupation}    exam_score=1
        ELSE IF     '${result}'=='REJECTED'
            Upload Group Of Labors      ${tect_center}     ${occupation}    wrong_timestamp=wrong
        ELSE
            Upload Group Of Labors      ${tect_center}     ${occupation}
        END
    END
    Click Labors
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Verify Search Result Value      amount=2

Verify Validation Edit Email On Labors Tab
    Click Labors
    Clik On Email Field
    FOR    ${wrong_email}    IN       @{INVALID_EMAIL}
        Fill Labor Email      ${wrong_email}
        ${error_email_message}     Get Text    ${ERROR_EMAIL_FIELD}
        Should Match        ${error_email_message}    ${TC_VALID_EMAIL}
    END

Edit And Verify Email
    Click Labors
    Clik On Email Field
    ${new_email}    Create Random Email
    Fill Labor Email        ${new_email}
    Click Save Email
