*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         DateTime
Library         String
Library         Libraries/LocatorFunction.py
Variables       POM/Locators/IndividualBookingLocators.py
Variables       POM/Locators/IndividualBaseLocators.py
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
    [Arguments]    ${right}=True
    Click Button    ${BTN_SELECT_OCCUPATION}
    IF    ${right}
        Click Button    ${SELECTED_OCCUPATION}
    ELSE
        Type Text    ${FIELD_OCCUPATION}       Zapel
    END

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
        ${state}=    Get Attribute      ${el}       aria-disabled
        IF      '${state}'=='false'
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

Click Transaction History
    Click Button    ${BTN_TRANSACTION_HISTORY_INDIVIDUAL}

Click Filter Icon
    Click Button    ${FILTER_ICON}

Fill Field Id
    [Arguments]    ${id}
    Type Text    ${FILTER_FIELD_ID}        ${id}

Fill Field Invoice Num
    [Arguments]    ${invoice}
    Type Text    ${FILTER_FIELD_INVOICE_NUM}    ${invoice}

Fill Field From
    [Arguments]    ${from}
    Type Text    ${FILTER_FIELD_FROM}       ${from}

Fill Field To
    [Arguments]    ${to}
    Type Text    ${FILTER_FIELD_TO}        ${to}
    Keyboard Key    press    Enter

Select Status
    [Arguments]    ${status}
    Click Button    ${FILTER_SELECT_STATUS}
    ${locator}=     Create Locator By Text     ${status}
    Click Button    ${locator}

Click Btn Apply
    Click Button    ${BTN_APPLY}

Click Btn Clear Filter
    Click Button    ${BTN_CLEAR_INDIVIDUAL_FILTER}

Get Successful Transaction
    ${elements}=    Get Elements    ${DOWNLOAD_ICON}
    [Return]    ${elements}[0]

Get Successful Appointment
    ${elements}=    Get Elements    ${INDIVIDUAL_SUCCESS_ACTIONS}
    [Return]    ${elements}[0]
