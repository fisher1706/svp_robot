*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminLaborsResultLocators.py


*** Keywords ***
Open Admin Labors Result Page
    Open Page    base_url=${ADMIN_URL}    page_url=labors
    Wait Spinners To Disappear
    Wait For Elements State    ${LABORS_RESULT_TEXT}      visible

Click Btn Search
    Click Button    ${BTN_SEARCH}

Click Btn Cancel
    Click Button    ${BTN_CANCEL}

Select Necessary Satus
    [Arguments]    ${status}
    Click Btn Cancel
    Select Options By    ${SELECT_STATS}    text    ${status}
    Click Btn Search
