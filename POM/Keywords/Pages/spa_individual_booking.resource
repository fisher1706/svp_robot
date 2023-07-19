*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         DateTime
Library         String
Library         Libraries/LocatorFunction.py
Variables       POM/Locators/IndividualBookingLocators.py
Variables       Resources/Variables/SuccessMessage.py


*** Keywords ***
Click Book And Appointment
    Click Button    ${BTN_BOOK_AN_APPOINTMENT}

Get Data Booked Appointments
    [Arguments]    ${status}=Reserved
    ${rowList}=     Create List
    @{elements}=    Get Elements    ${BOOKED_APPOINTMENTS}
    FOR  ${element}     IN      @{elements}
        ${text}=        Get Text      ${element}
        ${data}=    Split String    ${text}     \n
        IF    '${data}[-1]'=='${status}'
            Click Button    ${element}${EYE_ICON}
            Wait For Elements State     ${BOOKING_DETAILS_TEXT}     visible
            ${details}=     Get Last Entry    ${DETAILS_VALUE}
            Append To List      ${rowList}      ${details}
            Open Individual Boking Page
        END
    END
    [Return]        ${rowList}

Open Individual Boking Page
    Open Page    base_url=${SPA_URL}    page_url=labor/booking
    Wait For Elements State     ${BTN_BOOK_AN_APPOINTMENT}      enabled

Select Individual Occupation
    Click Button    ${BTN_SELECT_OCCUPATION}
    Click Button    ${SELECTED_OCCUPATION}

Verify Key Selected Occupation
    ${key}=     Get Text    ${OCCUPATION_KEY}
    Should Not Be Empty    ${key}

Verify Description Category
    ${text}=    Get Text    ${DESCRIPTION_CATEGORY}
    Verify Text     ${DESCRIPTION_CATEGORY}     ${MSG_DESCRIPTION_CATEGORY}

Select Individual City
    Wait For Elements State    ${CHOOSE_CITY_TEXT}      visible
    Click Button    ${BTN_SELECT_CITY}
    Click Button    ${SELECTED_CITY}

Select Individual Date
    Wait For Elements State     ${CHOOSE_DATE_TEXT}     visible
    ${date}=    Get Current Date        result_format=datetime
    ${locator}=     Create Locator By Text     ${date.day}
    ${elements}=    Get Elements    ${locator}
    FOR    ${el}    IN      @{elements}
        ${state}=    Get Element States     ${el}       then    value & (visible | hidden)
        IF      ${state}
            Click Button    ${el}
            BREAK
        ELSE
            CONTINUE
        END
    END

Select Individual Session
    Wait For Elements State    ${CHOOSE_SESSION_TEXT}       visible
    ${sessions}=    Get Elements    ${SESSION_CARDS}
    Click Button    ${sessions}[0]

Click Btn Next
    Click Button    ${BTN_NEXT_INDIVIDUAL}

Accept Summary Page
    Wait For Elements State     ${SUMMARY_PAGE_TEXT}        visible
    Check Checkbox      ${CHECKBOX}
    Click Button    ${BTN_NEXT_SUMMARY}

Click Btn Ok
    Click Button    ${BTN_INDIVIDUAL_OK}







