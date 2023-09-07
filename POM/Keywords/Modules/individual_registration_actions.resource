*** Settings ***
Resource            POM/Keywords/Pages/spa_individual_registration.resource
Library             Resources/DataSources/models/ModelBuilder.py
Library             Libraries/Api/actions/IndividualApiActions.py
Variables           POM/Locators/IndividualRegistrationLocators.py
Variables           Resources/Variables/ErrorMessage.py
Variables           Resources/Variables/WarningMessage.py
Variables           Resources/Variables/SuccessMessage.py


*** Keywords ***
Test Successfully Registration
    #TODO:  Update test after possibility get "otp_code"
    Open SPA Register Page
    ${individual}=    Create New Individual
    Fill General Information        individual=${individual}
    Confirm And Proceed
    Conformation Code Email     individual=${individual}

Test Verify Error Messages Individual Registration
    [Arguments]
    ...     ${national_id}=${EMPTY}
    ...     ${email}=${EMPTY}
    ...     ${passport_number}=${EMPTY}
    Open SPA Register Page
    ${individual}=    Create New Individual
    Fill General Information
    ...     individual=${individual}
    ...     national_id=${national_id}
    ...     email=${email}
    ...     passport_number=${passport_number}
    Verify Error Message
    ...     national_id=${national_id}
    ...     email=${email}
    ...     passport_number=${passport_number}

Test Verify Warning Messages Individual Registration
    [Arguments]
    ...     ${first_name}=${EMPTY}
    ...     ${last_name}=${EMPTY}
    ...     ${email}=${EMPTY}
    Open SPA Register Page
    IF      '${first_name}'!='${EMPTY}'     Fill Field First Name    ${first_name}
    IF      '${last_name}'!='${EMPTY}'     Fill Field Last Name    ${last_name}
    IF      '${email}'!='${EMPTY}'     Fill Field Email    ${email}
    Verify Warning Message
    ...     first_name=${first_name}
    ...     last_name=${last_name}
    ...     email=${email}

Test Ability Interrupt Registration
    Test Successfully Registration
    Click Btn Back
    Verify Text    ${INTERRUPT_FIELD_MSG}      ${MSG_INTERRUPT_INDIVIDUAL}

Fill General Information
    [Arguments]
    ...     ${individual}
    ...     ${national_id}=${EMPTY}
    ...     ${email}=${EMPTY}
    ...     ${passport_number}=${EMPTY}
    Fill Field First Name    ${individual.first_name}
    Fill Field Last Name     ${individual.last_name}
    IF      '${national_id}'=='${EMPTY}'
        Fill Field National Id    ${individual.national_id}
    ELSE
        Fill Field National Id    ${national_id}
    END
    IF      '${passport_number}'=='${EMPTY}'
        Fill Field Passport Number    ${individual.passport}
    ELSE
        Fill Field Passport Number    ${passport_number}
    END
    Select Country Of Residence
    Select Nationality
    IF    '${email}'=='${EMPTY}'
        Fill Field Email    ${individual.email}
    ELSE
        Fill Field Email    ${email}
    END
    Fill Field Date Of Birth    ${individual.date_of_birth}
    Fill Field Passport Expiration    ${individual.passport_expiration}
    Fill Field Password     ${individual.password}
    Fill Field Confirm Password    ${individual.password}
    Check Acknowledge
    Click Btn Continue

Conformation Code Email
    [Arguments]    ${individual}
    Verify Text    ${REGISTER_INTO_SVP_TEXT}    ${MSG_REGISTER_INTO_SVP}

Verify Error Message
    [Arguments]
    ...     ${national_id}=${EMPTY}
    ...     ${email}=${EMPTY}
    ...     ${passport_number}=${EMPTY}
    Click Btn Error Ok
    IF    '${national_id}'!='${EMPTY}'      Verify Text
    ...     ${FIELD_ERROR_MSG_NATIONAL_ID}       ${MSG_REGISTERED_NATIONAL_ID}      # robocop:disable=misaligned-continuation
    IF    '${email}'!='${EMPTY}'      Verify Text
    ...     ${FIELD_ERROR_MSG_EMAIL}       ${MSG_REGISTERED_EMAIL}      # robocop:disable=misaligned-continuation
    IF    '${passport_number}'!='${EMPTY}'      Verify Text
    ...     ${FIELD_ERROR_MSG_PASSPORT_NUMBER}       ${MSG_REGISTERED_PASSPORT_NUMBER}      # robocop:disable=misaligned-continuation

Verify Warning Message
    [Arguments]
    ...     ${email}=${EMPTY}
    ...     ${first_name}=${EMPTY}
    ...     ${last_name}=${EMPTY}
    IF    '${email}'!='${EMPTY}'      Verify Text
    ...     ${FIELD_ERROR_MSG_EMAIL}       ${MSG_INDIVIDUAL_WRONG_EMAIL}    # robocop:disable=misaligned-continuation
    IF    '${first_name}'!='${EMPTY}'      Verify Text
    ...     ${FIELD_ERROR_MSG_FIRST_NAME}       ${MSG_INDIVIDUAL_LONG_NAME}     # robocop:disable=misaligned-continuation
    IF    '${last_name}'!='${EMPTY}'      Verify Text
    ...     ${FIELD_ERROR_MSG_LAST_NAME}       ${MSG_INDIVIDUAL_LONG_NAME}      # robocop:disable=misaligned-continuation
