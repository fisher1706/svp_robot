*** Settings ***
Resource        POM/Keywords/Pages/admin_certificate_balance.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Libraries/Utils.py
Variables       Resources/Variables/Filters.py


*** Keywords ***
Test Use Filter On Certificate Balance Page
    [Arguments]    ${country}=Ukraine       ${filter_data}=${FILTER_OWNER_ROLE}
    Open Admin Certificate Balance Page
    FOR    ${item}      IN      @{filter_data}
        ${key}      ${value}=   Reformat Data Filter        ${item}
        Click Btn Cancel
        Wait Spinners To Disappear
        Wait Until Keyword Succeeds    5x    1 sec
        ...     Select Dropdown List    selector=${SELECT_OWNER_ROLE}       val=${key}
        Wait Spinners To Disappear
        Wait Until Keyword Succeeds    5x    1 sec
        ...     Select Dropdown List    selector=${SELECT_COUNTRY}       val=${country}
        Type Text    ${FIELD_OWNER_NAME}        ${value}
        Click Btn Seach
        Verify Filter   value=${value}
    END

Admin Certificate Balance Actions
    Open Admin Certificate Balance Page
    Wait Spinners To Disappear
    Wait For Elements State     ${CERTIFICATE_BALANCE_TEXT}       visible

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
