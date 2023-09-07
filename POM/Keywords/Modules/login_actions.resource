*** Settings ***
Library         Libraries/Api/actions/AuthApiActions.py
Library         Libraries/email/EmailClient.py
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Pages/login.resource
Resource        POM/Keywords/Pages/password.resource
Resource        POM/Keywords/Modules/password_actions.resource
Resource        POM/Keywords/Modules/dashboard_actions.resource
Resource        POM/Keywords/Pages/spa.resource
Variables       POM/Locators/LoginLocators.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/Authentication.py
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/UserInfo.py
Variables       POM/Locators/IndividualBaseLocators.py


*** Keywords ***
Enter Login And Password
    [Arguments]    ${login}    ${password}    ${is_click}=True
    Enter Login    ${login}
    Enter Password    ${password}
    IF    ${is_click}
        Click Continue Button
    ELSE
        Verify Sign In Button Is Dissabled
    END

Verify Confirm Code
    Verify Text    ${LOGIN_FORM}    ${CONFIRM_CODE}

Verify Login Error Msg
    [Arguments]    ${msg}
    Verify Text    ${ERROR_MSG}    ${msg}   is_equal=False

Proceed 2fa Email
    [Arguments]    ${email}
    ${two_factor_code}=    Get Confirmation Code    ${email}
    Enter 2fa Code    ${two_factor_code}
    Click Sign In Button

Proceed 2fa Api
    [Arguments]    ${email}    ${user_type}
    ${is_passed}=    False
    FOR    ${_}    IN RANGE    5
        ${auth_api}=    Get Otp Code    ${email}    ${user_type}
        Enter 2fa Code    ${auth_api}
        Click Sign In Button
        Sleep    1
        IF    True==Get Sign In btn status    CONTINUE
        ${is_passed}=    Set Variable    True
        BREAK
    END
    Should Be True    ${is_passed}    ${OTP_CODE}

Proceed 2fa Web
    [Arguments]    ${two_factor_code}=False    ${is_passed}=False
    FOR    ${_}    IN RANGE    5
        IF    not(${two_factor_code})
            ${two_factor_code}=    Get 2fa Code
        ELSE
            ${two_factor_code}=    Set Variable    ${None}
        END
        Enter 2fa Code    ${two_factor_code}
        Click Sign In Button
        Sleep    2
        ${is_displayed}=    Is Warning Msg Displayed
        ${is_status}=    Get Sign In Button Status Disabled
        IF    ${is_displayed}
            ${two_factor_code}=    Set Variable    None
        ELSE IF    ${is_status}
            CONTINUE
        ELSE
            ${is_passed}=    Set Variable    True
            BREAK
        END
    END
    Should Be True    ${is_passed}    ${OTP_CODE}

Log In To The Admin Portal
    [Arguments]    ${login}=${DEFAULT_LOGIN}     ${password}=${DEFAULT_PASSWORD}
    Open Login Page
    Enter Login And Password    ${login}    ${password}
    Verify Confirm Code
    Proceed 2fa Web
    Verify Admin Dashboard Welcome Text

Log In To The Spa Portal
    [Arguments]
    ...     ${login}=${INDIVIDUAL_DEFAULT_LOGIN}
    ...     ${password}=${INDIVIDUAL_DEFAULT_PASSWORD}
    ...     ${locator}=${ACCOUNT_DASHBOARD}
    ...     ${message}=${MSG_SUCCESS_INDIVIDUAL_LOGIN}
    Open SPA Login Page
    Enter Login And Password    ${login}    ${password}
    Verify Confirm Code
    Proceed 2fa Web
    Verify Spa Dashboard Welcome Text       ${locator}     ${message}

Log In By Api To The Admin Portal
    Open Login Page
    Request Token
    ${token}=    Get Token
    ${user}=    Get User Info
    Local Storage Set Item    key=auth_token_default    value=${token}
    Evaluate JavaScript    ${None}    localStorage.setItem('user', '${user}');
    Reload
    Verify Admin Dashboard Welcome Text

Log In To SPA
    [Arguments]    ${two_factor_verification}=${EMPTY}    ${email}=''
    ${test}=    Get Url
    ${result}=    Run Keyword And Return Status    Should Contain    ${test}    auth
    IF    not(${result})    Open SPA Login Page
    Enter Login And Password    ${email}    ${DEFAULT_PASSWORD}
    Verify Confirm Code
    IF    '${two_factor_verification}' == '${AUTH_WEB}'
        Proceed 2fa Web
    ELSE IF    '${two_factor_verification}' == '${EMPTY}'
        Proceed 2fa Web
    ELSE IF    '${two_factor_verification}' == '${AUTH_EMAIL}'
        Proceed 2fa Email    ${email}
    END

Activate Account And Set Password
    [Arguments]    ${email}     ${is_tcenter}   ${without_email_service}=True
    IF  ${without_email_service}
        Open Activation Page Link       ${is_tcenter}
    ELSE
        Open Activation Page    email=${email}
    END
    Verify Password Title
    Enter Login And Password On Password Form
    Verify Sign In Title

Log Out User
    Click On Profile Menu
    Click Logout Button
    Wait Login Page To Load

Ability Reset Password
    # TODO: Use Add success flow when email service will work
    [Arguments]    ${is_negative}=True
    Open SPA Login Page
    Click Forgot My Password
    Wait For Elements State    ${RESET_PASSWORD_TEXT}      visible
    IF    ${is_negative}
        FOR    ${item}      IN      @{INVALID_EMAIL_LIST}
            Type Text    ${FIELD_ENTER_EMAIL}       ${item}
            Verify Btn Continue Reset Dissabled
        END
    END

Activate Account And Reset Password With Invalid Credentials
    [Arguments]    ${is_tcenter}
    Open Activation Page Link       ${is_tcenter}
    Verify Password Title
    FOR    ${item}      IN      @{INVALID_PASSWORD_LIST}
        Reset Password On Password Form       password=${item}[0]     confirm_password=${item}[0]
    END
