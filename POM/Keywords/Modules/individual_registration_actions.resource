*** Settings ***
Resource            POM/Keywords/Pages/spa_individual_registration.resource
Library             Resources/DataSources/models/ModelBuilder.py
Variables           POM/Locators/IndividualRegistrationLocators.py


*** Keywords ***
Test Successfully Registration
    Open SPA Register Page
    ${individual}=    Create New Individual
    Fill General Information        individual=${individual}
    Confirm And Proceed
    Sleep    5


Fill General Information
    [Arguments]    ${individual}
    Fill Field First Name    ${individual.first_name}
    Fill Field Last Name     ${individual.last_name}
    Fill Field National Id    ${individual.national_id}
    Fill Field Passport Number    ${individual.passport}
    Select Country Of Residence
    Select Nationality
    Fill Field Email    ${individual.email}
    Fill Field Date Of Birth    ${individual.date_of_birth}
    Fill Field Passport Expiration    ${individual.passport_expiration}
    Fill Field Password     ${individual.password}
    Fill Field Confirm Password    ${individual.password}
    Check Acknowledge
    Click Btn Continue