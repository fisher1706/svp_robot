*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/SPACheckCertificateExamLocators.py
Variables           Resources/Variables/WarningMessage.py
Variables           Resources/Variables/SuccessMessage.py
Variables           Resources/Variables/ErrorMessage.py


*** Keywords ***
Open SPA Home Page
    Open Page    base_url=${SPA_URL}    page_url=home

Click Btn Check Certificate And Exam Result
    Click Button    ${BTN_CHECK_CERTIFICATE_AND_EXAM_RESULT}

Click Btn Verify
    Click Button    ${BTN_VERIFY}

Choose Check Labor Result
    Click Button    ${POINT_CHECK_LABOR_RESULT}

Verify Field Passport Number Is Visible
    Wait For Elements State    ${FIELD_PASSPORT_NUMBER}

Verify Field Certificate Number Is Visible
    Wait For Elements State    ${FIELD_CERTIFICATE_NUMBER}

Verify Field Nationality Code Is Visible
    Wait For Elements State    ${FIELD_NATIONALITY_CODE}

Verify Field Occpation Key Is Visible
    Wait For Elements State    ${FIELD_OCCUPATION_KEY}

Verify Btn Verify Is Disabled
    Wait For Elements State    ${BTN_VERIFY}        disabled

Click Hide Icon
    Click Button    ${HIDE_ICON}

Fill Passport Number
    [Arguments]    ${passport}
    Type Text    ${FIELD_PASSPORT_NUMBER}       ${passport}

Fill Certificate Number
    [Arguments]    ${certificate}
    Type Text    ${FIELD_CERTIFICATE_NUMBER}        ${certificate}

Fill Occupation Key
    [Arguments]    ${occupation}
    Type Text    ${FIELD_OCCUPATION_KEY}    ${occupation}

Fill Nationality Code
    [Arguments]    ${nationality}
    Type Text    ${FIELD_NATIONALITY_CODE}    ${nationality}

Verify Invalid Passport Warning Message
    Verify Text    ${FIELD_MSG_INVALID_PASSPORT}    ${MSG_INVALID_PASSWORD}

Verify Invalid Certificate Warning Message
    Verify Text    ${FIELD_MSG_INVALID_CERTIFICATE}      ${MSG_INVALID_CERTIFICATE}

Verify Final Check Message
    [Arguments]    ${locator}       ${message}
    Verify Text    ${locator}      ${message}

Verify Invalid Occupation Key
    Verify Text    ${FIELD_MSG_INVALID_OCCUPATION_KEY}      ${MSG_INVALID_OCCUPATION_KEY}

Verify Invalid Nationality Code
    Verify Text    ${FIELD_MSG_INVALID_NATIONALITY_CODE}      ${MSG_INVALID_NATIONALITY_CODE}
