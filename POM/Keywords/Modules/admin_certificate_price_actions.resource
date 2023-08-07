*** Settings ***
Resource        POM/Keywords/Pages/admin_certificate_price.resource
Resource        POM/Keywords/Pages/base.resource
Library         Libraries/Utils.py
Variables       POM/Locators/AdminCertificatePriceLocators.py


*** Variables ***
${DEFAULT_PRICE}    30


*** Keywords ***
Test Edit Certificate Price
    Admin Certificate Price Actions
    ${price}=      Return Random Number Limit
    Set Certificate Price    price=${price}
    Verify Certificate Price        price=${price}
    Set Default Certificate Price

Admin Certificate Price Actions
    Open Admin Certificate Price Page
    Wait Spinners To Disappear
    Wait For Elements State     ${CERTIFICATE_PRICE_TEXT}       visible

Set Certificate Price
    [Arguments]    ${price}
    Click Btn Edit
    Type Text    ${CERTIFICATE_PRICE_FIELD}        ${price}
    Click Btn Save
    Click Btn Confirm

Verify Certificate Price
    [Arguments]     ${price}
    Wait Spinners To Disappear
    Wait For Elements State     ${CERTIFICATE_PRICE_TEXT}       enabled
    ${value}=    Convert To String      ${price}
    Verify Text    ${CERTIFICATE_PRICE_VALUE}      ${value}     timeout=30s

Set Default Certificate Price
    Wait Spinners To Disappear
    Set Certificate Price       price=${DEFAULT_PRICE}
    Verify Certificate Price        price=${DEFAULT_PRICE}
