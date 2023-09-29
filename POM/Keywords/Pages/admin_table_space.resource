*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/base_actions.resource
Library         Libraries/LocatorFunction.py
Variables       POM/Locators/AdminTableSpaceLocators.py
Variables       Resources/Variables/AdminSpaceData.py


*** Keywords ***
Open Necessary Admin Page
    [Arguments]    ${page_url}
    Open Page    base_url=${ADMIN_URL}    page_url=${page_url}
    Wait Spinners To Disappear

Get Necessary Attribute
    [Arguments]    ${locator}    ${key}
    ${data}=        Get Style    ${locator}     key=${key}
    RETURN      ${data}

Verify Necessary Attribute
    [Arguments]    ${data}       ${attr}
    Should Be Equal        ${data}      ${attr}

Verify Necessary List Attributes
    [Arguments]    ${list}
    ${len}=     Get Length    ${list}
    FOR    ${i}     IN RANGE    3       ${len}
        Should Not Be Equal     ${list}[${i}]       ${list}[${${i}-1}]
    END

Select Dropdown Rows
    [Arguments]    ${locator}       ${arg}
    Click Button        ${locator}
    ${locator_choose}=     Create Locator Quantity Rows    ${arg}
    Click Button    ${locator_choose}

Verify Header Is Visible
    [Arguments]    ${locator}
    Wait For Elements State    ${locator}

Get Rows Count
    [Arguments]    ${locator}
    ${rowList}=     Create List
    ${rows}=     Get Elements    ${locator}
    ${len}=     Get Length    ${rows}
    RETURN      ${${len}-1}

Verify Rows Count
    [Arguments]    ${data}      ${data_standard}
    TRY
        Should Be Equal    ${data}      ${data_standard}
    EXCEPT
        Should Be True    '${data}'<'${data_standard}'
    END
