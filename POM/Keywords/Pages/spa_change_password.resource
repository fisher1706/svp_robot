*** Settings ***
Library         Browser
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/SPALocators.py
Variables       POM/Locators/SPAChangePasswordLocators.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/Titles.py


*** Keywords ***
Open Change Password Page
    Open Page    base_url=${SPA_URL}    page_url=auth/change-pass

Verify Title Change Password
    Verify Text    ${SPA_HEADER}    ${SPA_CHANGE_PASSWORD}

Click Back Button
    Click Button    ${BTN_BACK}

Fill Current Password
    [Arguments]    ${text}
    Type Secret    ${BTN_BACK}    $text

Fill New Password
    [Arguments]    ${text}
    Type Secret    ${FIELD_NEW_PASSWORD}    $text

Fill Confirmed New Password
    [Arguments]    ${text}
    Type Secret    ${FIELD_CONFIRMED_NEW_PASSWORD}    $text

Verify Warning Current Password
    Should Match    ${WARNING_CURRENT_PASSWORD}    ${INVALID_CURRENT_PASSWORD}

Verify Warning New Password
    Should Match    ${WARNING_NEW_PASSWORD}    ${SAME_NEW_PASSWORD}

Verify Warning Confirm New Password
    Should Match    ${WARNING_CONFIRM_NEW_PASSWORD}    ${MISMATCH_PASSWORD}

Verify Change Button Is Disabled
    Wait For Elements State    ${BTN_CHANGE_PASSWORD}    disabled

Verify Title Spa Professional Cccreditation Program
    Verify Text    ${HOME}    ${SPA_PROFESSIONAL_ACCREDITATION_PROGRAM}
