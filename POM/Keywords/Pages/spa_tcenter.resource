*** Settings ***
Library         Browser
Library         Libraries/Utils.py
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/SPALocators.py
Variables       POM/Locators/SPATcenterLocators.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/WrongTestCenterDataset.py
Variables       Resources/Variables/PageNumbersDataset.py


*** Keywords ***
Click Test Center
    Click Button    ${BTN_TCENTER}

Click Add Test Center
    Click Button    ${BTN_ADD_TCENTER}

Fill Name General Information
    [Arguments]    ${name}
    Type Text   ${FIELD_NAME_GENERAL_INFORMATION}   ${name}

Fill Official Contact Number
    [Arguments]    ${number}
    Type Text    ${FIELD_OFFICIAL_CONTACT_NUMBER}   ${number}

Check Select Category
    @{elements}=    Get Elements    ${CATEGORY_LIST}
    ${data}=    Get Text    ${elements}[0]
    Check Checkbox      //*[contains(text(),'${data}')]

Uncheck Select Category
    @{elements}=    Get Elements    ${CATEGORY_LIST}
    ${data}=    Get Text    ${elements}[0]
    Uncheck Checkbox    //*[contains(text(),'${data}')]

Select All Categories
    @{elements}=    Get Elements    ${CATEGORY_LIST}
    FOR  ${element}     IN      @{elements}
        ${data}=    Get Text           ${element}
        Check Checkbox      //*[contains(text(),'${data}')]
    END

Fill Name Test Centr Owner
    [Arguments]    ${name}
    Type Text       ${FIELD_NAME_TCENTR_OWNER}      ${name}

Fill TCenter Email
    [Arguments]    ${email}
    Type Text   ${FIELD_EMAIL}      ${email}

Fill City
    [Arguments]    ${city}
    Type Text   ${FIELD_CITY}       ${city}

Fill Street Name
    [Arguments]    ${street}
    Type Text    ${FIELD_STREET_NAME}   ${street}

Fill Postal Code
    [Arguments]    ${postal_code}
    Type Text    ${FIELD_POSTAL_CODE}   ${postal_code}

Click Add TC
    [Arguments]    ${selector}
    Click Button    ${selector}

Click Edit
    Click Button    ${BTN_EDIT}

Verify Field Id
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_ID}     ${val}
    Verify Text     ${ID}      ${val}

Verify Field Name
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_NAME}     ${val}
    Verify Text     ${NAME}      ${val}

Verify Field City
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_CITY}     ${val}
    Verify Text     ${CITY_TC}      ${val}

Verify Field Test Center Owner
    [Arguments]    ${val}
    Fill Filter Field       ${FILTER_TCENTER_OWNER}     ${val}
    Verify Text     ${TCENTER_OWNER}      ${val}

Verify Field Status
    [Arguments]    ${val}      ${attr}=text
    ${data}=      Get Text      ${STATUS}
    ${chose_status}=    Low String      ${data}
    Click Button    ${FILTER_STATUS}
    Select Options By    ${FILTER_STATUS}    ${attr}    ${chose_status}
    Keyboard Key    press    Enter
    Verify Text    ${STATUS}        ${val}

Verify Empty Name Field
    Verify Text     ${WARNING_NAME}     ${TC_EMPTY_NAME}

Verify Empty Contact Number Field
    Verify Text    ${WARNING_PHONE_NUMBER}      ${TC_CONTACT_NUMBER}

Verify Empty Category List
    Verify Text    ${WARNING_CATEGORY}      ${TC_EMPTY_CATEGORY_LIST}

Verify Empty Owner Name Field
    Verify Text    ${WARNING_OWNER_NAME}      ${TC_EMPTY_OWNER_NAME}

Verify Empty Email Field
    Verify Text    ${WARNING_EMAIL}      ${TC_EMPTY_EMAIL}

Verify Empty City Field
    Verify Text    ${WARNING_CITY}      ${TC_EMPTY_CITY}

Verify Empty Street Field
    Verify Text    ${WARNING_STREET}      ${TC_EMPTY_STREET}

Verify Warning Duplicate Name
    Verify Text    ${WARNING_NAME}     ${TC_NAME_IS_REGISTERED}

Verify Warning Duplicate Email
    Verify Text     ${WARNING_EMAIL}     ${EMAIL_IS_IN_USE}

Verify Search Result Value
    ${num}=    Convert To String       ${${PAGE_VALUES}+${1}}
    Verify Text     ${QUANTITY}     ${num}

Click Icon Edit
    Hover       ${ACTIONS}
    Click Button    ${ICON_EDIT_ACTION}

Click Icon View
    Hover       ${ACTIONS}
    Click Button    ${ICON_VIEW_ACTION}

Click Icon Remove
    Hover       ${ACTIONS}
    Click Button    ${ICON_REMOVE_ACTION}

Click Confirm
    Click Button    ${BTN_CONFIRM}
