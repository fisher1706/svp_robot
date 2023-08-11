*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Resource        POM/Keywords/Pages/spa_start_exam.resource
Resource        POM/Keywords/Modules/login_actions.resource
Resource        POM/Keywords/Pages/admin_test_centers.resource
Library         Libraries/LocatorFunction.py
Variables       POM/Locators/SPAStartExamLocators.py


*** Keywords ***
Test Add Reservation With Valid Data
    [Arguments]    ${agreement}=${EMPTY}
    ${reservation_data}=        Get Necessary Data For Test And Switch To TCenter
    Click Btn Start Exam
    Wait For Elements State    ${RESERVATION_INFO_TEXT}     visible
    Fill Test Tacker & Exam Info    entry=${reservation_data}       passport=${EMPTY}        reservation=${EMPTY}
    Verify Test Tacker & Exam Info      passport=${EMPTY}       reservation=${EMPTY}
    IF      '${agreement}'=='${EMPTY}'
        RETURN
    ELSE
        Verify Term And Conditions      agreement=${agreement}
    END

Test Add Reservation With Invalid Data
    [Arguments]     ${passport}=${EMPTY}        ${reservation}=${EMPTY}
    ${reservation_data}=        Get Necessary Data For Test And Switch To TCenter
    Click Btn Start Exam
    Wait For Elements State    ${RESERVATION_INFO_TEXT}     visible
    Fill Test Tacker & Exam Info    entry=${reservation_data}   passport=${passport}    reservation=${reservation}

Get Necessary Data For Test And Switch To TCenter
    Log In By Api To The Admin Portal
    Admin SVPI Reservations Actions
    ${entry}=       Get Last Entry    ${LAST_ENTRY}
    Open Test Centers Page
    ${email}=    Choose Necessaaty TCenter    entry=${entry}
    Log In To SPA    email=${email}
    [Return]    ${entry}

Admin SVPI Reservations Actions
    Open Admin SVPI Reservations Page
    Wait Spinners To Disappear
    Wait For Elements State     ${SVPI_RESERVATIONS_TEXT}       visible

Choose Necessaaty TCenter
    [Arguments]    ${entry}
    Type Text       ${FILTER_FIELD_NAME}    ${entry}[8]
    Type Text       ${FILTER_FIELD_CITY}    ${entry}[7]
    Select Dropdown County      text=${entry}[5]
    Select Dropdown Filter Statuses        text=Active
    Click Button Search
    ${actions}=    Create Locator Actions     ${entry}[8]
    ${view}=    Create Locator View     ${entry}[8]
    Click Icon View     icon_actios=${actions}     icon_view=${view}
    Wait For Elements State     ${HEADER_SECTIONS_TEXT}       visible
    ${tcenter_email}=   Get Text    ${FIELD_EMAIL}
    [Return]    ${tcenter_email}
