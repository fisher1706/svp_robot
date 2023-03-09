*** Settings ***
Library    Browser
Library    String
Variables   ../../Locators/LoginLocators.py
Resource    base.resource

*** Variables ***
${page_url}=    auth

*** Keywords ***
Open Login page
    Open page   base_url=${ADMIN_URL}     page_url=${page_url}

Enter login
    [Arguments]     ${Email}
    Type Text   selector=${LOGIN_FIELD}     txt=${Email}

Enter password
    [Arguments]     ${password}
    Type Text   selector=${PASSWORD_FIELD}    txt=${password}

Verify button is dissabled
    ${btn_status}=  Get Element States    ${SIGN_IN_BUTTON}    then    bool(disabled)
    Should Be True  ${btn_status}

Get 2fa code
    ${otp_text}=    Get Text    ${OTP_CODE}
    @{list}=    Split String    ${otp_text} ${SPACE}
    [Return]    ${list}[2]

Is warning msg displayed
    ${status}=  Get Element States    ${OTP_CODE_WARNING_MSG}    then    bool(value & attached)
    [Return]    ${status}

Enter 2fa code
    [Arguments]     ${code}
    Type Text   selector=${TWO_FA_FIELD}    txt=${code}

Click Sign In_btn
    Click   ${SIGN_IN_BUTTON}

Get Sign In btn status disabled
    ${status}=    Get Element States    ${SIGN_IN_BUTTON}   then  bool(attached & disabled)
    [Return]    ${status}

