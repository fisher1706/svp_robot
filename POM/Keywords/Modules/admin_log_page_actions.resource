*** Settings ***
Resource        POM/Keywords/Pages/admin_log_page.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Libraries/Utils.py
Variables       POM/Locators/AdminCertificatePriceLocators.py
Variables       Resources/Variables/Filters.py


*** Keywords ***
Test Open Actions Log Page
    Admin Log Actions
    Choose Item Actions
    Wait For Elements State     ${DETAILS_TEXT}       visible
    ${data}=    Get Last Entry      ${DETAILS_ITEM}
    Should Not Be Empty    ${data}

Test Use Filter On Log Page
    Admin Log Actions
    ${entity_value}=       Return Random Data List      ${ACTIONS_LOG_ENTITY_FILTER_OPTIONS}
    ${key}      ${value}=   Reformat Data Filter        ${entity_value}
    ${contains_value}=       Return Random Data List      ${CONTAINS_FILTER_OPTIONS}
    Click Btn Cancel
    Select Dropdown List    selector=${SELECT_ENTITY_NAME}       val=${key}
    Select Dropdown List    selector=${SELECT_CONTAINS}       val=${contains_value}
    Type Text    ${FILTER_FIELD}        ${value}
    Click Btn Seach
    Verify Filter   value=${value}

Admin Log Actions
    Open Admin Actions Log Page
    Wait Spinners To Disappear
    Wait For Elements State     ${ACTIONS_LOG_TEXT}       visible

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
