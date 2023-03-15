*** Settings ***
Library    String
Library    Browser
Variables   ../../Locators/LoginLocators.py
Resource    base.resource


*** Keywords ***
Open Login Page
    Open Page   base_url=${ADMIN_URL}   page_url=auth

Enter Login
    [Arguments]     ${Email}
    Type Text   selector=${LOGIN_FIELD}     txt=${Email}

Enter Password
    [Arguments]     ${password}
    Type Text   selector=${PASSWORD_FIELD}    txt=${password}

Verify Button Is Dissabled
    ${btn_status}=  Get Element States    ${SIGN_IN_BUTTON}    then    bool(disabled)
    Should Be True  ${btn_status}

Get 2fa Code
    ${otp_text}=    Get Text    ${OTP_CODE}
    @{list}=    Split String    ${otp_text} ${SPACE}
    [Return]    ${list}[2]

Is Warning Msg Displayed
    ${status}=  Get Element States    ${OTP_CODE_WARNING_MSG}    then    bool(value & attached)
    [Return]    ${status}

Enter 2fa Code
    [Arguments]     ${code}
    Type Text   selector=${TWO_FA_FIELD}    txt=${code}

Click Sign In Button
    Click   ${SIGN_IN_BUTTON}

Get Sign In Button Status Disabled
    ${status}=    Get Element States    ${SIGN_IN_BUTTON}   then  bool(attached & disabled)
    [Return]    ${status}
