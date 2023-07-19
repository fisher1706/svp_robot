*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Pages/spa_individual_booking.resource
Variables       POM/Locators/IndividualBookingLocators.py
Variables       Resources/Variables/WarningMessage.py


*** Keywords ***
Individual Booking Actions
    [Arguments]    ${payment}=True      ${session}=True
    ${data}=    Get Data Booked Appointments
    Click Book And Appointment
    Wait For Elements State    ${BOOK_AN_APPOINTMENT_TEXT}      visible
    Select Individual Occupation
    Verify Key Selected Occupation
    Verify Description Category
    Select Individual City
    Select Individual Date
    Select Individual Session
    Click Btn Next
    Accept Summary Page
    IF    ${payment}
        CONTINUE
    ELSE
        Should Not Be Empty     ${data}
        Verify Text    ${ALREADY_RESERVATION}       ${MSG_ALREADY_RESERVATION}
    END
    Click Btn Ok

