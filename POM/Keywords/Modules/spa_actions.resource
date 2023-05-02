*** Settings ***
Documentation       SPA Actions
# TODO: Separate methods by each functionality and remove from this file
Resource        POM/Keywords/Modules/base_actions.resource


*** Keywords ***
Get Last Entry
    [Arguments]     ${locator}
    ${rowList}=     Create List
    @{elements}=    Get Elements    ${locator}
    FOR  ${element}     IN      @{elements}
        ${text}=        Get Text      ${element}
        Append To List      ${rowList}      ${text}
    END
    [Return]    ${rowList}

Fill Filter Field
    [Arguments]    ${locator}       ${val}
    Type Text    ${locator}     ${val}

Is Disabled
    [Arguments]    ${filters}
    FOR    ${locator}   IN      @{filters}
        Verify Text     ${locator}      ${EMPTY}
    END
