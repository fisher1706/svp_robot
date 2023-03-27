*** Settings ***
Library         Browser
Variables       POM/Locators/PasswordPageLocators.py
Variables       Resources/Variables/Titles.py
Variables       POM/Locators/BaseLocators.py
Variables       Resources/Variables/ErrorMessage.py


*** Keywords ***
Open Password Page
    Open Page    base_url=${ADMIN_URL}    page_url=auth

Enter Password Activate
    [Arguments]    ${password}
    Type Secret    selector=${PASSWORD_FIELD_FORM}    secret=$password

Enter Confirmed Password Activate
    [Arguments]    ${confirm_password}
    Type Secret    selector=${CONFIRMED_PASSWORD}    secret=$confirm_password

Wait Password Page To Load
    Wait For Elements State    selector=${PASSWORD_FIELD_FORM}    visible

Verify Password Title
    Verify Text    ${SPA_LOGIN}    ${SPA_SET_PASSWORD}

Verify Message Confirmed Password Warning
    Verify Text    ${PASS_WARNING_LOCATOR}    ${CONFIRMED_PASS_WARNING}

Verify Message Password Warning
    Verify Text    ${PASS_WARNING_LOCATOR}    ${PASS_WARNING}

Verify Message Token Warning
    Verify Text    ${TOKEN_WARNING}    ${TOKEN_INVALID}
