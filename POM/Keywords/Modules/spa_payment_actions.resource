*** Settings ***
Library         Collections
Library         BuiltIn
Library         Browser
Library         Libraries/Utils.py
Library         Libraries/FileHelper.py
Resource        POM/Keywords/Pages/spa_payment.resource
Resource        POM/Keywords/Modules/spa_upload_actions.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Pages/spa_transaction_history.resource
Variables       Resources/Variables/GetCreditsDataset.py
Variables       Resources/Variables/TransactionState.py
Variables       Resources/Variables/ErrorMessage.py
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/DirPath.py


*** Keywords ***
Test Get Credits
    [Arguments]    ${amount}=1
    ${states}       Get Slice From List     ${TRANSACTION_STATE_LIST}         end=-1
    FOR    ${state}     IN      @{states}
        IF    '${state}'!='${TRANSACTION_STATE_LIST}[0]'
            CONTINUE
        ELSE
            Pass Credit Flow        ${state}
            Click Payment
            Verify Credits Counter      ${amount}
        END
    END

Test Issue Certificate
    Upload Group Of Labors Index
    Click Payment
    Verify Credits Counter      0
    Verify Number Of Labors     0
    ${total_amount}       Return Total Price      amount=0
    Verify Total Amount     ${total_amount}

Test Get Verify Input Fields On Add Credits
    [Arguments]    ${amount}=1
    Click Payment
    Click Get Credit
    FOR     ${item}     IN      ${INVALID_CERTIFICATES}
        Fill Certificates       ${item}
        Wait For Elements State    ${BTN_PAY}      disabled
    END
    Fill Certificates       ${amount}
    Click Pay
    FOR     ${item}     IN      @{INVALID_CARD_DETAILS}
        Log To Console    ${item}
        Fill Card Details       ${item}
        Verify Text     ${WARNING_MSG_CARD_NUMBER}      ${MSG_CARD_NUMBER}
        Verify Text     ${WARNING_MSG_EXPIRY_DATE}      ${MSG_CARD_EXPIRY_DATE}
        Verify Text     ${WARNING_MSG_CARD_HOLDER}      ${MSG_CARD_HOLDER}
    END

Test Number Of Labors And Total Amount Counters
    [Arguments]    ${amount}=1
    Upload Group Of Labors Index
    Pass Credit Flow    state=${TRANSACTION_STATE_LIST}[0]
    Click Payment
    Verify Total Labors     ${amount}
    ${total_amount}       Return Total Price      ${amount}      full=False
    Verify Amount Entry     ${total_amount}

Test Download Certificate
    [Arguments]     ${amount}=1
    Clear Temp Folder
    Pass Labor Flow     ${amount}
    ${file_name}        Get Certificate File Name
    ${dl_promise}    Promise To Wait For Download    ${TEMP_FOLDER}/certificates${file_name}.zip
    Dowload Certificates
    ${file_obj}    Wait For  ${dl_promise}
    Unzip Temp File
    ${data_pdf}     Read Pdf File
    Should Not Be Empty      ${data_pdf}

Test Payment Info
    [Arguments]     ${amount}=1
    Pass Labor Flow     ${amount}
    ${total_amount}       Return Total Price      ${amount}     full=False
    Verify Payment File Name
    Verify Payment Number Of Passed Labors      ${amount}
    Verify Payment Price Per Labor
    Verify Payment Total Amount     ${total_amount}
    Verify Grand Total      ${total_amount}
    Verift Transaction Amount       ${total_amount}
    Verify Transaction Date

Test Invoice After Passing Get Credits Flow
    [Arguments]     ${amount}=1
    Clear Temp Folder
    Pass Labor Flow     ${amount}
    Click Transaction History
    ${dl_promise}    Promise To Wait For Download    ${TEMP_FOLDER}/invoice.pdf
    Download Invoice
    ${file_obj}    Wait For  ${dl_promise}
    ${data_pdf}     Read Pdf File
    Should Not Be Empty      ${data_pdf}

Pass Credit Flow
    [Arguments]    ${state}    ${amount}=1
    Get Credit      ${amount}
    Fill Card Details
    TRY
        Click Pay Now
    EXCEPT
        Click Pay Now
    END
    Select Dropdown Transaction State       ${state}
    Click Transaction Pay
    Wait For Elements State    ${WAITING_SPINNER}      hidden
    IF    '${state}'=='${TRANSACTION_STATE_LIST}[0]'
        ${reference}     Get Text        ${REFERENCE_NUMBER}
        Should Not Be Empty      ${reference}
    END

Get Credit
    [Arguments]    ${amount}
    Click Payment
    Click Get Credit
    Fill Certificates       ${amount}
    ${total_amount}       Return Total Price      ${amount}
    Verify Text     ${TOTAL}        ${total_amount}     is_equal=False
    Click Pay

Fill Card Details
    [Arguments]    ${card_details}=${VALID_CARD_DETAILS}
    Wait For Elements State    ${FIELD_CARD_HOLDER}
    Fill Card Number        ${card_details[0]}
    Fill CVV                ${card_details[3]}
    Fill Expity Date        ${card_details[1]}
    Fill Card Holder        ${card_details[2]}

Pass Labor Flow
    [Arguments]     ${amount}=1
    Upload Group Of Labors Index    ${amount}
    Pass Credit Flow    state=${TRANSACTION_STATE_LIST}[0]
    Approve Payment

Approve Payment
    Click Payment
    Click Select All
    Click Issue
    Click Confirm
    Wait Spinners To Disappear
    Verify Text    ${CERTIFICATES}       ${MSG_CERTIFICATE}
