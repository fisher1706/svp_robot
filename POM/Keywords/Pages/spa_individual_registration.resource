*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Resource            POM/Keywords/Modules/spa_actions.resource
Library             Libraries/Utils.py
Library             Libraries/LocatorFunction.py
Variables           POM/Locators/IndividualRegistrationLocators.py
Variables           Resources/Variables/SuccessMessage.py


*** Keywords ***
Open SPA Register Page
    Open Page    base_url=${SPA_URL}    page_url=register

Fill Field First Name
    [Arguments]    ${data}
    Type Text    ${FIELD_FIRST_NAME}        ${data}

Fill Field Last Name
    [Arguments]    ${data}
    Type Text    ${FIELD_LAST_NAME}        ${data}

Fill Field National Id
    [Arguments]    ${data}
    Type Text    ${FIELD_NATIONAL_ID}        ${data}

Fill Field Passport Number
    [Arguments]    ${data}
    Type Text    ${FIELD_PASSPORT_NUMBER}        ${data}

Fill Field Email
    [Arguments]    ${data}
    Type Text    ${FIELD_EMAIL}        ${data}

Fill Field Date Of Birth
    [Arguments]    ${data}
    Type Text    ${FIELD_DATE_OF_BIRTH}        ${data}
    Keyboard Key    press    Enter

Fill Field Passport Expiration
    [Arguments]    ${data}
    Type Text    ${FIELD_PASSPORT_EXPIRATION}        ${data}
    Keyboard Key    press    Enter

Fill Field Password
    [Arguments]    ${data}
    Type Text     ${FIELD_PASSWORD}      ${data}

Fill Field Confirm Password
    [Arguments]    ${data}
    Type Text     ${FIELD_CONFIRM_PASSWORD}        ${data}

Select Country Of Residence
    Click Button    ${SELECT_COUNTRY_OF_RESIDENCE}
    ${countries}=       Get Last Entry    ${OPEN_COUNTRIES}
    ${locator}=     Create Locator By Text      ${countries}[${NUMBER_DEFAULT_COUNTRY}]
    Click Button    ${locator}

Select Nationality
    Click Button    ${SELECT_NATIONALITY}

Check Acknowledge
    Check Checkbox    ${CHECKBOX_ACKNOWLEDGE}

Click Btn Continue
    Click Button    ${BTN_CONTINUE}

Confirm And Proceed
    Wait For Elements State    ${PASSPORT_NUMBER_TEXT}      visible
    Click Button    ${BTN_CONFIRM_AND_PROCEED}

Enter 2fa Code
    [Arguments]    ${code}
    Type Secret    selector=${TWO_FA_FIELD}    secret=$code

Click Btn Continue Email
    Click Button    ${BTN_CONTINUE_EMAIL}

Click Btn Error Ok
    Click Button    ${BTN_ERROR_OK}

Click Btn Back
    Click Button    ${BTN_BACK}
