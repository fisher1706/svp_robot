*** Settings ***
Resource        POM/Keywords/Pages/admin_csv_history_page.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/AdminCsvHistoryPageLocators.py


*** Keywords ***
Test Open Csv History Page
    Admin Csv History Actions
    Choose Item Actions
    Wait For Elements State     ${BTN_CANCEL}       hidden
    ${data}=    Get Last Entry      ${LAST_ENTRY}
    Should Not Be Empty    ${data}

Admin Csv History Actions
    Open Admin Csv History Page
    Wait Spinners To Disappear
    Wait For Elements State     ${CSV_HISTORY_TEXT}       visible
