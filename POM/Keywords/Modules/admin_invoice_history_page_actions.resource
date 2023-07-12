*** Settings ***
Resource        POM/Keywords/Pages/admin_invoice_history_page.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/AdminInvoiceHistoryPageLocators.py


*** Keywords ***
Test Open Invoice History Page
    Admin Invoice History Actions
    Choose Item Actions
    Wait For Elements State     ${REFERENCE_NUMBER_TEXT}       visible
    ${data}=    Get Last Entry      ${DETAILS_LIST}
    Should Not Be Empty    ${data}

Admin Invoice History Actions
    Open Admin Invoice History Page
    Wait Spinners To Disappear
    Wait For Elements State     ${INVOICE_HISTORY_TEXT}       visible
