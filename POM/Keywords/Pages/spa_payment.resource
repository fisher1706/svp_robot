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

Fill CVV
    [Arguments]    ${cvv}
    Type Text       ${FIELD_CVV}    ${cvv}

Fill Card Holder
    [Arguments]    ${card_holder}
    Type Text       ${FIELD_CARD_HOLDER}    ${card_holder}
    Keyboard Key    press    Enter

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
