*** Settings ***
Resource    base_actions.resource
Resource    base_actions.py
Resource    ../Pages/login.resource
Resource    ../../../Libraries/Api/features/auth_api.py
Variables     ../../Locators/LoginLocators.py
Variables   ../../../Resources/Variables/WarningMessage.py
Variables   ../../../Resources/Variables/Authentication.py
Variables   ../../../Resources/Variables/SuccessMessage.py

*** Keywords ***
Log in to the Admin portal
    [Arguments]     ${login}  ${password}   ${is_click}=${True}
    Open Login Page
    Enter login     ${login}
    Enter password  ${password}
    IF  ${is_click}
        Click continue btn
    ELSE
        Verify button is dissabled
    END

Verify admin confirm code
    Verify message  ${LOGIN_FORM}   ${ADMIN_CONFIRM_CODE}

Verify login error msg
    [Arguments]     ${msg}
    Verify message  ${ERROR_MSG}   ${msg}

Proceed 2fa via email
    [Arguments]     ${email}
    ${two_factor_code}=     Get confirmation code   ${email}
    Enter 2fa code  ${two_factor_code}
    Click Sign In_btn

Proceed 2fa api
    [Arguments]     ${email}    ${user_type}
    ${is_passed}=   ${False}
    FOR     ${_} IN Range |0|   |5|
        ${auth_api}=    Get otp code    ${email}    ${user_type}
        Enter 2fa code  ${auth_api}
        Click Sign In_btn
        [Timeout]    3
        IF  ${True}==   Get Sign In btn status
            CONTINUE
        ${is_passed}=   ${True}
        BREAK
        END
    END
    Should Be True  ${is_passed}    ${OTP_CODE}

Proceed 2fa web
    [Arguments]     ${two_factor_code}=${FALSE}  ${is_passed}=${FALSE}
    FOR     ${_}    IN RANGE   5
        IF    not(${two_factor_code})
            ${two_factor_code}=     Get 2fa code
        END
        Enter 2fa code  ${two_factor_code}
        Click Sign In_btn
        Sleep   2
        ${is_displayed}=    Is warning msg displayed
        ${is_status}=   Get Sign In btn status disabled
        IF  ${is_displayed}
            ${two_factor_code}=     Set Variable    ${NONE}
        ELSE IF     ${is_status}
            CONTINUE
        ELSE
            ${is_passed}=   Set Variable    ${TRUE}
            BREAK
        END
    END
    Should Be True  ${is_passed}    ${OTP_CODE}
