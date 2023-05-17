*** Settings ***
Library         Browser
Library         Libraries/Utils.py
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/SPATransactionHistoryLocators.py


*** Keywords ***
Click Transaction History
    Click Button    ${BTN_TRANSACTION_HISTORY}

Download Invoice
    Click Button    ${ICON_INVOICE}

Verify Field Refernce Number
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_REFERENCE_NUMBER}      ${val}
    Verify Text     ${REFERENCE_NUMBER_HISTORY}      ${val}

Verify Field Amount
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_AMOUNT}      ${val}
    Verify Text     ${AMOUNT_HISTORY}      ${val}

Verify Field Date
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_DATE}      ${val}
    Verify Text     ${DATE_HISTORY}      ${val}

Verify Field Status
    [Arguments]    ${val}      ${attr}=text
    ${data}=      Get Text      ${STATUS_HISTORY}
    ${chose_status}=    Low String      ${data}
    Click Button    ${FILTER_STATUS}
    Select Options By    ${FILTER_STATUS}    ${attr}    ${chose_status}
    Keyboard Key    press    Enter
    Verify Text    ${STATUS_HISTORY}        ${val}
