*** Settings ***
Library    Browser
Variables   POM/Locators/BaseLocators.py
Variables   POM/Locators/LegislatorsPageLocators.py
Variables   Resources/Variables/Titles.py
Variables   Resources/Variables/Status.py
Resource    POM/Keywords/Modules/base_actions.resource


*** Keywords ***
Open Legislator Page
    [Arguments]    ${base_url}=${ADMIN_URL}      ${page_url}=legislators
    Go To  url=${base_url}${page_url}

Verify Title Legislators
    Verify Text    ${HEADER}    ${LEGISLATORS}

Verify Title New Legislator
    [Arguments]    ${name}=None
    ${message}  Set Variable If     'type(${name})' == str     ${name}     ${NEW_LEGISLATOR}
    Wait For Elements State     ${HEADER}  visible
    Verify Text  ${HEADER}   ${message}

Click Button New Legislators
    Click Button   ${BTN_NEW_LEGISLATORS}

Click Button Create Legislator
    Click Button   ${BTN_CREATE_LEGISLATOR}

Upload Logo File
    [Arguments]    ${dir_path}=None
    Upload File By Selector   ${BTN_LOGO_FILE}   ${dir_path}

Select Legislator Dropdown County
    [Arguments]    ${text}
    Click Button    ${DROPDOWN_COUNTRY}
    Select Options By   ${DROPDOWN_COUNTRY}     text   ${text}
    Keyboard Key    press   Enter

Fill Legislator Name
    [Arguments]    ${text}
    Type Text   ${FIELD_LEGISLATOR_NAME}   ${text}

Fill Legislator City
    [Arguments]    ${text}
    Type Text   ${FIELD_CITY}   ${text}
    ${elements}=    Get Elements   selector=.pac-item   # robocop:disable=inconsistent-assignment
    Click   ${elements}[0]

Fill Legislator Address
    [Arguments]    ${text}
    Type Text   ${FIELD_ADDRESS}   ${text}

Fill Contact Name
    [Arguments]    ${text}
    Type Text   ${FIELD_CONTACT_NAME}   ${text}

Fill Phone Number
    [Arguments]    ${text}
    Type Text   ${FIELD_CONTACT_PHONE_NUMBER}   ${text}

Fill Legislator Email
    [Arguments]    ${text}
    Type Text   ${FIELD_EMAIL}   ${text}
