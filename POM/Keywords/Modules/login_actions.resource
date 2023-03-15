*** Settings ***
Library     base_actions.py
Library     Libraries/Api/features/auth_api.py
Library     Libraries/Api/actions/AuthApiActions.py
Resource    POM/Keywords/Modules/base_actions.resource
Resource    POM/Keywords/Pages/login.resource
Resource    POM/Keywords/Modules/dashboard_actions.resource
Variables   POM/Locators/LoginLocators.py
Variables   Resources/Variables/WarningMessage.py
Variables   Resources/Variables/Authentication.py
Variables   Resources/Variables/SuccessMessage.py
Variables   Resources/Variables/UserInfo.py


*** Keywords ***
Enter Login And Password
    [Arguments]     ${login}  ${password}   ${is_click}=True
    Enter Login     ${login}
    Enter Password  ${password}
    IF  ${is_click}
        Click Continue Button
    ELSE
        Verify Button Is Dissabled
    END

Verify Admin Confirm Code
    Verify Text  ${LOGIN_FORM}   ${ADMIN_CONFIRM_CODE}

Verify Login Error Msg
    [Arguments]     ${msg}
    Verify Text  ${ERROR_MSG}   ${msg}

Proceed 2fa Via Email
    [Arguments]     ${email}
    ${two_factor_code}=     Get Confirmation Code   ${email}
    Enter 2fa Code  ${two_factor_code}
    Click Sign In Button

Proceed 2fa Api
    [Arguments]     ${email}    ${user_type}
    ${is_passed}=   False
    FOR     ${_}    IN RANGE    5
        ${auth_api}=    Get Otp Code    ${email}    ${user_type}
        Enter 2fa Code  ${auth_api}
        Click Sign In Button
        Sleep   1
        IF  True==Get Sign In btn status    CONTINUE
        ${is_passed}=   Set Variable    True
        BREAK
    END
    Should Be True  ${is_passed}    ${OTP_CODE}

Proceed 2fa Web
    [Arguments]     ${two_factor_code}=False  ${is_passed}=False
    FOR     ${_}    IN RANGE   5
        ${two_factor_code}=     Run Keyword If  not(${two_factor_code})     Get 2fa Code
        Log To Console    ${two_factor_code}
        Enter 2fa Code  ${two_factor_code}
        Click Sign In Button
        Sleep   2
        ${is_displayed}=    Is Warning Msg Displayed
        ${is_status}=   Get Sign In Button Status Disabled
        IF  ${is_displayed}
            ${two_factor_code}=     Set Variable    None
        ELSE IF     ${is_status}
            CONTINUE
        ELSE
            ${is_passed}=   Set Variable    True
            BREAK
        END
    END
    Should Be True  ${is_passed}    ${OTP_CODE}

Log In To The Admin Portal
    Open Login Page
    Enter Login And Password  ${DEFAULT_LOGIN}    ${DEFAULT_PASSWORD}
    Verify Admin Confirm Code
    Proceed 2fa Web
    Verify Admin Dashboard Welcome Text

Log In By Api To The Admin Portal
    Open Login Page
    Request Token
    ${token}=   Get Token
    ${user}=   Get User Info
    Local Storage Set Item  key=auth_token_default    value=${token}
    Evaluate JavaScript     ${None}    localStorage.setItem('user', '${user}');
    Reload
    Verify Admin Dashboard Welcome Text
