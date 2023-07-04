*** Settings ***
Resource        POM/Keywords/Pages/admin_transactions_log.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Libraries/Utils.py
Variables       Resources/Variables/Filters.py


*** Keywords ***
Test Open Transactions Log Page
    Admin Transactions Log Actions
    Choose Item Actions
    Wait For Elements State     ${BOX_TITLE_TEXT}       visible
    ${data}=    Get Last Entry      ${DETAILS_ITEM}
    Should Not Be Empty    ${data}

Test Use Filter On Transactions Log Page
    Admin Transactions Log Actions
    FOR    ${item}      IN      ${TRANSACTIONS_LOG_FILTER_OPTIONS}
        ${key}      ${value}=   Reformat Data Filter        ${item}
        Click Btn Cancel
        Select Dropdown List    selector=${SELECT_STATUS}       val=${key}
        Type Text    ${FIELD_TRANSACTION_DATE}        ${value}
        Click Btn Seach
        Sleep    3
#        Verify Filter   value=${value}
    END

Admin Transactions Log Actions
    Open Admin Transactions Log Page
    Wait Spinners To Disappear
    Wait For Elements State     ${TRANSACTIONS_LOG_TEXT}       visible






Select Dropdown List
    [Arguments]    ${selector}      ${val}     ${attr}=text
    Click Button    ${selector}
    Select Options By    ${selector}    ${attr}    ${val}
    Keyboard Key    press    Enter

Verify Filter
    [Arguments]    ${value}
    Wait Spinners To Disappear
    ${entry}=       Get Last Entry      ${LAST_ENTRY}
    List Should Contain Value       ${entry}        ${value}
