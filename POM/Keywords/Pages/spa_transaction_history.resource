*** Settings ***
Library         Browser
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/SPATransactionHistoryLocators.py


*** Keywords ***
Click Transaction History
    Click Button    ${BTN_TRANSACTION_HISTORY}

Download Invoice
    Click Button    ${ICON_INVOICE}
