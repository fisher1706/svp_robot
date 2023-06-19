*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminLaborsResultLocators.py
Variables           POM/Locators/SPALocators.py


*** Keywords ***
Open Admin Labors Result Page
    Open Page    base_url=${ADMIN_URL}    page_url=labors
    Wait Spinners To Disappear
    Wait For Elements State    ${LABORS_RESULT_TEXT}      visible

Click Next
    Click Button    ${BTN_NEXT}
