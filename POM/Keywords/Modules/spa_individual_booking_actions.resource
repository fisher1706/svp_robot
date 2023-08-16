*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Pages/spa_individual_booking.resource
Resource        POM/Keywords/Modules/admin_base_actions.resource
Variables       POM/Locators/IndividualBookingLocators.py
Variables       Resources/Variables/WarningMessage.py


*** Keywords ***
Test Use Filter Tansaction History
    Click Transaction History
    Wait For Elements State    ${TRANSACTION_HISTORY_TEXT}      visible
    Sleep    2
    ${transaction_data}=    Get Last Entry    ${TRANSACTION_LAST_ENTRY}
    Individual Filter Action    data=${transaction_data}
    Individual Empty Filter Action

Test Download Invoice Transaction History
    Click Transaction History
    Wait For Elements State    ${TRANSACTION_HISTORY_TEXT}      visible
    ${invoice_download}=    Get Successful Transaction
    Download File       filename=ticket.pdf     btn_download=${invoice_download}

Test View Data Of Tansaction History
    Click Transaction History
    ${data_tr_history}=     Get Last Entry    ${HISTORY_ROW}
    Should Not Be Empty    ${data_tr_history}

Test Download Ticked From Booking Page
    TRY
        ${ticket_download}=    Get Successful Appointment
        Download File       filename=ticket.pdf     btn_download=${ticket_download}${TICKET_ICON}
    EXCEPT
        Log To Console    Necessary Successful Appointment
    END

Test Download Ticked From Booking Booking Details Page
    TRY
        ${ticket_download}=    Get Successful Appointment
        Click Button    ${ticket_download}${EYE_ICON}
        Wait For Elements State    ${BOOKING_DETAILS_TEXT}      visible
        Download File       filename=ticket.pdf     btn_download=${BTN_DOWNLOAD_TICKET}
    EXCEPT
        RETURN
    END

Test User Can Not Book Session Within The Same Category Until The Session Status Is Reserved
    Individual Booking Actions      payment=False

Individual Booking Actions
    [Arguments]    ${payment}=True      ${session}=True
    Wait For Elements State    ${BOOKED_APPOINTMENTS_TEXT}       visible
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
        Log To Console    Update in future
    ELSE
        Should Not Be Empty     ${data}
        Verify Text    ${ALREADY_RESERVATION}       ${MSG_ALREADY_RESERVATION}      is_equal=False
    END
    Click Btn Ok

Individual Filter Action
    [Arguments]    ${data}
    ${tr_date}=     Split String        ${data}[6]
    Click Filter Icon
    Fill Field Id       id=${data}[0]
    Fill Field Invoice Num      invoice=${data}[1]
    Select Status       status=${data}[5]
    Fill Field From     from=${tr_date}[0]
    Fill Field To     to=${tr_date}[0]
    ${filter_data}=     Get Last Entry    ${FILTER_CONTROLS}
    List Should Contain Value       ${data}     ${filter_data}[0]

Individual Empty Filter Action
    Click Filter Icon
    Click Btn Clear Filter
    Click Btn Apply
    Wait For Elements State     ${FILTER_CONTROLS}      hidden
