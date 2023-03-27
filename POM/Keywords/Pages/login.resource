*** Settings ***
Library         String
Library         Browser
Variables       POM/Locators/LoginLocators.py
Variables       Resources/Variables/Titles.py
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/base_actions.resource


*** Keywords ***
Open Login Page
    Open Page    base_url=${ADMIN_URL}    page_url=auth

Open SPA Login Page
    Open Page    base_url=${SPA_URL}    page_url=auth

Enter Login
    [Arguments]    ${Email}
    Type Text    selector=${LOGIN_FIELD}    txt=${Email}

Enter Password
    [Arguments]    ${password}
    Type Secret    selector=${PASSWORD_FIELD}    secret=$password

Verify Sign In Button Is Dissabled
    ${btn_status}=    Get Element States    ${SIGN_IN_BUTTON}    then    bool(disabled)
    Should Be True    ${btn_status}

Get 2fa Code
    ${otp_text}=    Get Text    ${OTP_CODE}
    @{list}=    Split String    ${otp_text} ${SPACE}
    RETURN    ${list}[2]

Is Warning Msg Displayed
    ${status}=    Get Element States    ${OTP_CODE_WARNING_MSG}    then    bool(value & attached)
    RETURN    ${status}

Enter 2fa Code
    [Arguments]    ${code}
    Type Secret    selector=${TWO_FA_FIELD}    secret=$code

Click Sign In Button
    Click    ${SIGN_IN_BUTTON}

Get Sign In Button Status Disabled
    ${status}=    Get Element States    ${SIGN_IN_BUTTON}    then    bool(attached & disabled)
    RETURN    ${status}

Verify Sign In Title
    Wait Until Keyword Succeeds    5x    1 sec    Verify Text    ${SPA_LOGIN}    ${SPA_SIGN_IN}
