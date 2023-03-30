*** Settings ***
Library         String
Library         Browser
Variables       POM/Locators/LoginLocators.py
Variables       POM/Locators/DashboardLocators.py
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/base_actions.resource


*** Keywords ***
Open Admin Page
    [Arguments]    ${page_url}=auth
    Open Page    base_url=${ADMIN_URL}    page_url=${page_url}

Click User Tab
    [Arguments]    ${row}=None
    Click Button    ${TAB_USERS}
    ${locator}=    Set Variable If    'typr(${row})'==str    ${ROW_LABORS}    ${ROW_LEGISLATORS}
    Click Button    ${locator}    visible

Click Test Centers Tab
    Click Button    ${TAB_TEST_CENTERS}
    Click Button    ${ROW_TEST_CENTERS}

Click Reservations Tab
    Click Button    ${TAB_TEST_CENTERS}
    Click Button    ${ROW_RESERVATIONS}

Click Settings Tab
    Click Button    ${TAB_USERS}
    Click Button    ${ROW_COUNTRY_SETTINGS}
