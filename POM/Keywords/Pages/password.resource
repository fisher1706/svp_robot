*** Settings ***
Library    String
Library    Browser
Variables   POM/Locators/PasswordPageLocators.py
Variables   Resources/Variables/Titles.py
Variables   POM/Locators/BaseLocators.py
Resource    base.resource


*** Keywords ***
Open Password Page
    Open Page   base_url=${ADMIN_URL}   page_url=auth

Enter Password On Password Form
    [Arguments]    ${password}
    Type Text   selector=${PASSWORD_FIELD}    txt=${password}

Enter Confirmed Password
    [Arguments]    ${password}
    Type Text   selector=${CONFIRMED_PASSWORD}    txt=${password}

Wait Password Page To Load
    Wait For Elements State     ${PASSWORD_FIELD}     visible

Verify Password Title
    Verify Text  ${SPA_LOGIN}   ${SPA_SIGN_IN}
