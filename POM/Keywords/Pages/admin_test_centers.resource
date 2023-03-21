*** Settings ***
Library    Browser
Variables   POM/Locators/BaseLocators.py
Variables   POM/Locators/AdminTestCentersLocators.py
Variables   Resources/Variables/Titles.py
Variables   Resources/Variables/Status.py
Variables   Resources/Variables/Filters.py
Resource    POM/Keywords/Modules/base_actions.resource
Resource    POM/Keywords/Pages/dashboard.resource


*** Keywords ***
Open Test Centers Page
    Open Admin Page     page_url=centers
    Verify Title Test Center

Verify Title Test Center
    Verify Text    ${HEADER}    ${TEST_CENTER}

# Test Centers

Click Btn New Test Center
    Click Button   ${BTN_NEW_TEST_CENTER}

Click Button Search
    Click Button    ${BTN_SEARCH}

Click Button Cancel
    Click Button    ${BTN_NEW_TEST_CENTER}

Select Dropdown Name
    [Arguments]     ${key}=${CONTAINS}
    Select Options By   ${DROPDOWN_NAME}  text  ${key}

Select Dropdown City
    [Arguments]     ${key}=${CONTAINS}
    Select Options By   ${DROPDOWN_CITY}  text  ${key}

Fill Filter Name
    [Arguments]     ${text}
    Type Text   selector=${FILTER_FIELD_NAME}    txt=${text}

Fill Filter City
    [Arguments]     ${text}
    Type Text   selector=${FIELD_CITY}    txt=${text}

Select Dropdown Statuses
    [Arguments]    ${key}=${ACTIVE}
    Select Options By   ${DROPDOWN_LEGISLATOR}  text  ${key}

Select View Of Last Entry
    Hover   ${ICON_DOTS}
    Click Button    ${ICON_VIEW_ACTION}

Select Edit Of Last Entry
    Hover   ${ICON_DOTS}
    Click Button    ${ICON_EDIT_ACTION}
    Wait Spinners To Disappear

Select Remove Of Last Entry
    Hover   ${ICON_DOTS}
    Click Button    ${ICON_REMOVE_ACTION}

# New Test Center

Verify Title New Test Center
    [Arguments]    ${name}=None
    ${message}=      Set Variable If     'type(${name})'==str     ${name}     ${NEW_TEST_CENTER}
    Wait For Elements State     ${HEADER}  visible
    Verify Text  ${HEADER}   ${message}

Verify Warning Message
    [Arguments]    ${msg}
    Wait For Elements State     ${HEADER}  visible
    Verify Text  ${HEADER}   ${msg}

Click Button Create Test Center
    Click Button    ${BTN_CREATE_TEST_CENTER}

Select Dropdown County
    [Arguments]    ${text}
    Click Button    ${DROPDOWN_COUNTRY}
    Select Options By   ${DROPDOWN_COUNTRY}     text   ${text}
    Keyboard Key    press   Enter

Select Dropdown Category
    [Arguments]    ${text}
    Click Button    ${DROPDOWN_CATEGORY}
    ${elements}=    Get Elements    ${DROPDOWN_CATEGORY_ITEM}
    FOR    ${el}    IN  @{elements}
        Click   ${el}
    END

Fill Name
    [Arguments]     ${text}
    Type Text   selector=${FIELD_NAME}    txt=${text}

Fill City
    [Arguments]     ${text}
    Type Text   selector=${FIELD_CITY}    txt=${text}
    ${elements}=    Get Elements   selector=.pac-item
    Click   ${elements}[0]

Fill Address
    [Arguments]     ${text}
    Type Text   selector=${FIELD_ADDRESS}    txt=${text}

Fill Phone
    [Arguments]     ${text}
    Type Text   selector=${FIELD_CONTACT_PHONE}    txt=${text}

Select Legislator
    [Arguments]     ${text}
    Select Options By   ${DROPDOWN_LEGISLATOR}  text  ${text}

Fill Test Center Owner Name
    [Arguments]     ${text}
    Type Text   selector=${FIELD_TEST_CENTER_OWNER_NAME}    txt=${text}

Fill Email
    [Arguments]     ${text}
    Type Text   selector=${FIELD_TEST_CENTER_OWNER_EMAIL}    txt=${text}

# View

Verify Message Test Center Creation
    Verify Text  ${TEST_CENTER_CREATION_LOCATOR}   ${TEST_CENTER_CREATION}

Verify Name In Title
    [Arguments]    ${text}
    Verify Text     ${TITLE}  ${text}

Verify Name
    [Arguments]    ${text}
    Verify Text     ${NAME}  ${text}

Verify Adress
    [Arguments]    ${text}
    Verify Text     ${ADDRESS}  ${text}

Verify Category
    [Arguments]    ${text}
    Verify Text     ${SUPPORTED_CATEGORIES}  ${text}

Verify Country
    [Arguments]    ${text}
    Verify Text     ${COUNTRY}  ${text}

Verify City
    [Arguments]    ${text}
    Verify Text     ${CITY}  ${text}

Verify Status
    [Arguments]    ${status}=${ACTIVE}
    Verify Text     ${STATUS}  ${status}

Verify Phone Number
    [Arguments]    ${text}
    Verify Text     ${PHONE_NUMBER}  ${text}

Verify Legislator
    [Arguments]    ${text}='Autotest'
    Verify Text     ${LEGISLATOR}  ${text}

Verify Test Center Owner Name
    [Arguments]    ${text}
    Verify Text     ${TEST_CENTER_OWNER_NAME}  ${text}

Verify Test Center Owner Email
    [Arguments]    ${email}
    Verify Text     ${TEST_CENTER_OWNER_EMAIL}  ${email}
