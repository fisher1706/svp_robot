*** Settings ***
Resource        POM/Keywords/Pages/spa_labor.resource
Resource        POM/Keywords/Modules/spa_upload_actions.resource
Resource        POM/Keywords/Modules/spa_payment_actions.resource
Library         Resources/DataSources/models/ModelBuilder.py
Library         String
Variables       Resources/Variables/dataset.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/dataset.py      PageNumbersDataset


*** Variables ***
${AMOUNT}       11
@{LIST_EXAM_RESULTS}
...     PASSED
...     FAILED
...     PENDING
...     REJECTED


*** Keywords ***
Test Legislator Validation Edit Email On Labors Tab
    Upload Group Of Labors Index
    Verify Validation Edit Email On Labors Tab

Test Legislator Edit Email On Labors Tab
    Upload Group Of Labors Index
    Edit And Verify Email

Test Legislator Pagination And Search Result Value
    FOR    ${_}    IN RANGE    ${AMOUNT}
        Upload Group Of Labors Index
    END
    Click Next Labor
    Verify Search Result Value      ${AMOUNT}

Test Legislator All Count On Labors Tab
    Upload Group Of Labors Index
    Click Labors
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Verify Search Result Value      amount=1
    Click Uploaded Files
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     visible
    Upload Group Of Labors Index
    Click Labors
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Verify Search Result Value      amount=2

Test Legislator Search Entry By Filters On Labors Table
    Upload Group Of Labors Index        amount=5
    Click Labors
    Wait For Elements State    ${COUNT}    visible
    ${elements}    Get Last Entry    ${LAST_ENTRY}
    Verify National Id      ${elements}[0]
    Verify Labor Name       ${elements}[1]
    Verify Passport Number       ${elements}[2]
    Verify Email       ${elements}[3]
    Verify Category       ${elements}[4]
    Verify TCenter
    Verify Exam Date        ${elements}[6]
    ${str}     Convert To Lower Case       ${elements}[7]
    Verify Exam Result      ${str}
    Verify Disabling Filters Fields Labors

Test Legislator Counts On Labors Tab
    FOR    ${result}    IN      @{LIST_EXAM_RESULTS}
        IF    '${result}'=='PASSED'
            Upload Group Of Labors Index
            Generate Payment        amount=1
            Activate payment
            Click Uploaded Files
        ELSE IF     '${result}'=='FAILED'
            Upload Group Of Labors Index      exam_score=1
        ELSE IF     '${result}'=='REJECTED'
            Upload Group Of Labors Index      wrong_timestamp=wrong
        ELSE
            Upload Group Of Labors Index
        END
    END
    Click Labors
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Verify All      4

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

Verify Disabling Filters Fields Labors
    Click Clear Filter
    Verify Text     ${SEARCH_RESULTS}      5 Search Results       is_equal=True
