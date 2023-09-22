*** Settings ***
Resource            POM/Keywords/Pages/spa_check_certificate_exam.resource
Variables           POM/Locators/IndividualRegistrationLocators.py
Variables           Resources/Variables/CheckCertificateExamResultData.py


*** Keywords ***
Test To Chek
    Click Btn Check Certificate And Exam Result
    Verify Items Check Sertificate Validity
    Choose Check Labor Result
    Verify Items Check Labor Result
    Click Hide Icon

Test Ability Enter Certificate Data And Verify System Message
    [Arguments]    ${passport}      ${certificates}     ${locator}     ${message}
    # TODO: Add method for get test data from DB in future
    Click Btn Check Certificate And Exam Result
    FOR    ${certificate}   IN      @{certificates}
        Fill Certificate Validity Form      passport=${passport}        certificate=${certificate}
        Click Btn Verify
        Verify Final Check Message      locator=${locator}     message=${message}
    END

Test Negative Verification Certificate
    # TODO: Add method for get test data from DB in future
    Click Btn Check Certificate And Exam Result
    FOR    ${passport}   IN      @{INVALID_PASSPORT_NUMBERS}
        Fill Certificate Validity Form      passport=${passport}        certificate=${EMPTY}
        Verify Items Check Sertificate Validity     passport=${passport}    certificate=${EMPTY}     data=False
    END
    FOR    ${certificate}   IN      @{INVALID_CERTIFICATES}
        Fill Certificate Validity Form      passport=${EMPTY}        certificate=${certificate}
        Verify Items Check Sertificate Validity     passport=${EMPTY}    certificate=${certificate}     data=False
    END

Test Verification Labor Result
    # TODO: Add method for get test data from DB in future
    [Arguments]    ${passport}      ${occupation}       ${nationality}      ${message}=${EMPTY}     ${is_warning}=True
    Click Btn Check Certificate And Exam Result
    Choose Check Labor Result
    Fill Labor Result Form      passport=${passport}    occupation=${occupation}    nationality=${nationality}
    IF    ${is_warning}
        Verify Items Check Labor Result
        ...     passport=${passport}
        ...     occupation=${occupation}
        ...     nationality=${nationality}
        ...     data=False
    ELSE
        Click Btn Verify
        Verify Final Check Message      locator=${FIELD_LABOR_RESULT_MESSAGE}       message=${message}
    END

Fill Certificate Validity Form
    [Arguments]     ${passport}=${EMPTY}      ${certificate}=${EMPTY}
    IF    '${passport}'!='${EMPTY}'     Fill Passport Number    passport=${passport}
    IF    '${certificate}'!='${EMPTY}'     Fill Certificate Number     certificate=${certificate}

Fill Labor Result Form
    [Arguments]    ${passport}=${EMPTY}     ${occupation}=${EMPTY}      ${nationality}=${EMPTY}
    IF    '${passport}'!='${EMPTY}'     Fill Passport Number    passport=${passport}
    IF    '${occupation}'!='${EMPTY}'     Fill Occupation Key    occupation=${occupation}
    IF    '${nationality}'!='${EMPTY}'     Fill Nationality Code    nationality=${nationality}

Verify Items Check Sertificate Validity
    [Arguments]    ${passport}=${EMPTY}      ${certificate}=${EMPTY}    ${data}=${EMPTY}
    IF    '${data}'=='${EMPTY}'
        Verify Field Passport Number Is Visible
        Verify Field Certificate Number Is Visible
    ELSE
        IF    not(${data})
            IF    '${passport}'!='${EMPTY}'     Verify Invalid Passport Warning Message
            IF    '${certificate}'!='${EMPTY}'     Verify Invalid Certificate Warning Message
        END
    END
    Verify Btn Verify Is Disabled

Verify Items Check Labor Result
    [Arguments]    ${passport}=${EMPTY}      ${occupation}=${EMPTY}    ${nationality}=${EMPTY}     ${data}=${EMPTY}
    # TODO: Add method for get test data from DB in future
    IF    '${data}'=='${EMPTY}'
        Verify Field Passport Number Is Visible
        Verify Field Occpation Key Is Visible
        Verify Field Nationality Code Is Visible
    ELSE
        IF    not(${data})
            IF    '${passport}'!='${EMPTY}'     Verify Invalid Passport Warning Message
            IF    '${occupation}'!='${EMPTY}'     Verify Invalid Occupation Key
            IF    '${nationality}'!='${EMPTY}'     Verify Invalid Nationality Code
        END
    END
    Verify Btn Verify Is Disabled
