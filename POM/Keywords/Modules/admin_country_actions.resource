*** Settings ***
Resource        POM/Keywords/Pages/admin_country.resource
Resource        POM/Keywords/Pages/base.resource
Variables       POM/Locators/AdminCountryLocators.py
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/Filters.py
Variables       Resources/Variables/ErrorMessage.py
Variables       Resources/Variables/WarningMessage.py


*** Keywords ***
Test Create New Country
    Admin Country Actions
    Click New Country
    Wait Spinners To Disappear
    Wait For Elements State     ${NEW_COUNTRY_TEXT}       visible
    Select Dropdown List      selector=${COUNTRY}
    Fill Field Mandated Date
    Set Settings Legislator And TCenter
    Choose Category
    Fill Group Expire Years
    Verify Active Add Button

Test Edit Country Page By Edit Button
    Open Admin Country Page
    Choose Item Actions     type=Edit
    Wait For Elements State     ${EDIT_COUNTRY}       visible
    Set Settings Legislator And TCenter
    Fill Field Mandated Date
    Click Btn Edit
    Verify Edit Country

Test Edit Country Page From View Page
    Open Admin Country Page
    Choose Item Actions     type=View
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible
    Click Btn Edit
    Choose Category
    Fill Group Expire Years
    Click Btn Edit
    Verify Edit Country

Test Edit Pass Percentage For Category
    Open Admin Country Page
    Choose Item Actions     type=Edit
    Wait For Elements State     ${EDIT_COUNTRY}       visible
    Fill Group Expire Years     years=False
    Click Btn Edit
    Verify Edit Country

Test Not Ability Save Pass Percentage Less Than 50 Per Category
    Open Admin Country Page
    Choose Item Actions     type=Edit
    Wait For Elements State     ${EDIT_COUNTRY}       visible
    Fill Group Expire Years     start=1      end=40
    Verify Edit Button Is Dissabled

Test Select Nationality
    Open Admin Country Page
    Choose Item Actions     type=Edit
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible
    ${natioality}=      Choose Nationality
    Click Btn Edit
    TRY
        Verify Edit Country
    EXCEPT
        Verify Text     ${LINKED_NATIONALITY}      ${MSG_LINKED_NATIONALITY}    is_equal=False
    END

Test Filter By Country
    Open Admin Country Page
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible
    Country Filter
    Verify Filters Country

Test Filter By Legislator
    Open Admin Country Page
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible
    ${value}=       Filter      filter_options=${LEGISLATOR_TCENTER_FILTER_OPTIONS}     locator=${LEGISLATOR}
    Verify Filters      value=${value}       locator=${LEGISLATOR_TAB}

Test Filter By TCenter
    Open Admin Country Page
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible
    ${value}=       Filter      filter_options=${LEGISLATOR_TCENTER_FILTER_OPTIONS}     locator=${TCENTER}
    Verify Filters      value=${value}       locator=${TCENTER_TAB}

Admin Country Actions
    Open Admin Country Page
    Wait Spinners To Disappear
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible

Verify Edit Country
    Wait Spinners To Disappear
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible
    TRY
        Verify Text    ${COUNTRY_SUCCESSFULLY_UPDATED}      ${SUCCESS_UPDATE_MESSAGE}
    EXCEPT
        ${cuntry}=      Get Text    ${EDIT_COUNTRY}
        Should Not Be Empty    ${cuntry}
    END

Verify Edit Button Is Dissabled
    Wait For Elements State    ${BTN_EDIT}    disabled

Verify Active Add Button
    Wait For Elements State    ${BTN_ADD}    enabled

Country Filter
    [Arguments]    ${default_country}=Denmark
    Click Btn Cancel
    ${value}=       Return Random Number Limit      start=0     end=2
    Select Dropdown List      selector=${COUNTRY_CHOOSE_OPTION}       val=${value}
    Type Text       ${COUNTRY}      ${default_country}
    Click Btn Seach

Filter
    [Arguments]    ${filter_options}        ${locator}
    Click Btn Cancel
    ${value}=       Return Random Data List      ${filter_options}
    Select Dropdown List      selector=${locator}       val=${value}     attr=text
    Click Btn Seach
    [Return]        ${value}

Verify Filters Country
    [Arguments]    ${default_country}=Denmark
    Wait Spinners To Disappear
    Verify Text    ${COUNTRY_TAB}       ${default_country}

Verify Filters
    [Arguments]    ${value}     ${locator}
    Wait Spinners To Disappear
    TRY
        Verify Text     ${locator}      ${value}    is_equal=False
    EXCEPT
        Verify Text    ${NO_DATA}      ${MSG_NO_DATA}
    END
