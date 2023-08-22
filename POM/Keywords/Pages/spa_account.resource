*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/SPAAccountLocators.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/Titles.py


*** Keywords ***
Open Account Information Page
    Open Page    base_url=${SPA_URL}    page_url=account

Verify Title Account Information
    Verify Text    ${SPA_HEADER}    ${SPA_ACCOUNT_INFORMATION}

Get Attribute Or Text
    [Arguments]    ${locator}    ${is_edit}
    IF    ${is_edit}
        ${result}=      Get Text     ${locator}
        RETURN      ${result}
    END
    ${result}=      Get Text        ${locator}
    RETURN      ${result}

Get Show Logo
    [Arguments]    ${is_edit}=False
    IF    ${is_edit}
        ${result}=    Get Property    ${TOGGLE_STATUS}    checked
        RETURN    ${result}
    END
    ${result}=    Get Text    ${TOGGLE_SHOW_LOGO}
    RETURN    ${result}

Get Address
    [Arguments]    ${is_edit}=False
    ${locator}=    Set Variable If    ${is_edit}    ${FIELD_ADDRESS}    ${ADDRESS}
    ${result}=    Get Attribute Or Text    ${locator}    ${is_edit}
    RETURN    ${result}

Get Postal Code
    [Arguments]    ${is_edit}=False
    ${locator}=    Set Variable If    ${is_edit}    ${FIELD_POSTAL_CODE}    ${POSTAL_CODE}
    ${result}=    Get Attribute Or Text    ${locator}    ${is_edit}
    RETURN    ${result}

Get Full Name
    [Arguments]    ${is_edit}=False
    ${locator}=    Set Variable If    ${is_edit}    ${FIELD_FULL_NAME}    ${FULL_NAME}
    ${result}=    Get Attribute Or Text    ${locator}    ${is_edit}
    RETURN    ${result}

Get Phone Number
    [Arguments]    ${is_edit}=False
    ${locator}=    Set Variable If    ${is_edit}    ${FIELD_PHONE_NUMBER}    ${PHONE_NUMBER}
    ${result}=    Get Attribute Or Text    ${locator}    ${is_edit}
    RETURN    ${result}

Get Email
    [Arguments]    ${is_edit}=False
    ${locator}=    Set Variable If    ${is_edit}    ${FIELD_EMAIL}    ${EMAIL}
    ${result}=    Get Attribute Or Text    ${locator}    ${is_edit}
    RETURN    ${result}

Click Edit Button
    Click Button    ${BTN_EDIT}

Verify Button Id Disabled
    Get Element States    ${BTN_SAVE}    validate    value & disabled

Click Cancel Button
    Click Button    ${BTN_CANCEL}

Click Save Button
    Click Button    ${BTN_SAVE}

Fill Address
    [Arguments]    ${text}
    Type Text    ${FIELD_ADDRESS}    ${text}

Fill Postal Code
    [Arguments]    ${text}
    Type Text    ${FIELD_POSTAL_CODE}    ${text}

Fill Full Name
    [Arguments]    ${text}
    Type Text    ${FIELD_FULL_NAME}    ${text}

Fill Account Phone Number
    [Arguments]    ${text}
    Type Text    ${FIELD_PHONE_NUMBER}    ${text}

Fill Account Email
    [Arguments]    ${text}
    Type Text    ${FIELD_EMAIL}    ${text}

Select Show Logo Toggle
    Click Button    ${TOGGLE_EDIT_SHOW_LOGO}
#    s(self.TOGGLE_EDIT_SHOW_LOGO).should(be.in_dom).click()

Upload Logo File
    [Arguments]    ${dir_path}=None
    Upload File By Selector    ${BTN_LOGO_FILE}    ${dir_path}

Verify Warning Digits Only Postal Code
    Verify Text        ${WARNING_POSTAL_CODE}    ${TC_ONLY_DIGITS_POSTAL_CODE}

Verify Warning En Chars Only Name
    Verify Text     ${WARNING_NAME}    ${ONLY_EN_CHARS}     is_equal=False

Verify Warning Digits Only Contact Number
    Should Match    ${WARNING_PHONE_NUMBER}    ${TC_ONLY_DIGITS_CONTACT_NUMBER}

Verify Warning Invalid Email Field
    Verify Text     ${WARNING_EMAIL}    ${TC_VALID_EMAIL}

Verify Warning Duplicate Email
    Should Match    ${WARNING_EMAIL}    ${EMAIL_IS_EXIST}
