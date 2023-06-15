*** Settings ***
Documentation       SPA Actions
Library         String
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Pages/spa.resource


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

Fill And Verify Field
    [Arguments]
    ...     ${data}
    ...     ${field_locator}
    ...     ${field_message}
    ...     ${btn_locator}
    ...     ${message}
    FOR    ${val}   IN  @{data}
        Type Text       ${field_locator}        ${val}
        Click Button        ${btn_locator}
        Verify Text     ${field_message}        ${message}
    END

Verify Disabling Filters Fields
    [Arguments]    ${filters}
    Click Clear Filter Button
    FOR    ${locator}   IN      @{filters}
        Verify Text     ${locator}      ${EMPTY}
    END

Choose Value With Button
    [Arguments]    ${locator_btn}   ${locator_input}   ${value}
    Click Button    ${locator_btn}
    Type Text       ${locator_input}    ${value}
    Keyboard Key    press    Enter
