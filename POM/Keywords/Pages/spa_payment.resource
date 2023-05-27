*** Settings ***
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/SPAPaymentLocators.py


*** Keywords ***
Click Payment
    Click Button        ${BTN_PAYMENT}

Click Get Credit
    Click Button        ${BTN_GET_CREDIT}

Fill Certificates
    [Arguments]     ${amount}
    Type Text    ${FIELD_CERTIFICATES}      ${amount}

Click Pay
    Click Button        ${BTN_PAY}

Fill Card Number
    [Arguments]    ${card_number}
    Type Text    ${FIELD_CARD_NUMBER}       ${card_number}

Fill Expity Date
    [Arguments]    ${expiry_date}
    Type Text       ${FIELD_EXPIRY_DATE}    ${expiry_date}
    Keyboard Key    press    Enter

Fill CVV
    [Arguments]    ${cvv}
    Type Text       ${FIELD_CVV}    ${cvv}

Fill Card Holder
    [Arguments]    ${card_holder}
    Type Text       ${FIELD_CARD_HOLDER}    ${card_holder}
    Click       ${CARD_HOLDER_TEXT}

Click Pay Now
    Click Button    ${BTN_PAY_NOW}

Click Transaction Pay
    Click Button    ${BTN_TRANSACTION_PAY}

Click Select All
    Click Button    ${SELECT_ALL}

Click Issue
    Click Button    ${BTN_ISSUE}

Click Confirm
    Click Button    ${BTN_CONFIRM}

Select Dropdown Transaction State
    [Arguments]    ${val}     ${attr}=text
    Select Options By    ${DROPDOWN_TRANSACTION_STATE}    ${attr}    ${val}
    Keyboard Key    press    Enter

Verify Credits Counter
    [Arguments]    ${amount}
    Verify Text     ${CREDITS_COUNTER}        ${amount}     is_equal=True

Verify Number Of Labors
    [Arguments]    ${amount}
    Verify Text     ${NUMBER_OF_LABORS}        ${amount}     is_equal=True

Verify Total Amount
    [Arguments]    ${amount}
    Verify Text     ${TOTAL_AMOUNT}        ${amount}     is_equal=True

Verify Total Labors
    [Arguments]    ${amount}
    Verify Text    ${TOTAL_LABORS}      ${amount}       is_equal=True

Verify Amount Entry
    [Arguments]    ${amount}
    Verify Text    ${AMOUNT_ENTRY}     ${amount}       is_equal=False

Get Certificate File Name
    ${file_name}=     Get Text    ${FILE_NAME}
    [Return]        ${file_name}

Verify Payment File Name
    ${file_name}=     Get Text    ${FILE_NAME}
    Should Not Be Empty     ${file_name}

Verify Payment Number Of Passed Labors
    [Arguments]    ${amount}
    Verify Text     ${NUMBER_OF_PASSED_LABORS}      ${amount}

Verify Payment Price Per Labor
    ${price}=     Get Text    ${FILE_NAME}
    Should Not Be Empty     ${price}

Verify Payment Total Amount
    [Arguments]    ${amount}
    Verify Text     ${TOTAL_AMOUNT_PAYMENT}      ${amount}      is_equal=False

Verify Grand Total
    [Arguments]    ${amount}
    Verify Text     ${GRAND_TOTAL}      ${amount}   is_equal=False

Verift Transaction Amount
    [Arguments]    ${amount}
    Verify Text     ${AMOUNT_TRANS}      ${amount}      is_equal=False

Verify Transaction Date
    ${date}=     Get Text    ${DATE}
    Should Not Be Empty     ${date}

Dowload Certificates
    Click Button    ${BTN_DOWNLOAD}
