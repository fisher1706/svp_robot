*** Settings ***
Resource            POM/Keywords/Modules/base_actions.resource
Library             Libraries/Utils.py
Variables           POM/Locators/AdminOccupationLocators.py


*** Keywords ***
Click New Occupation
    Click Button        ${BTN_NEW_OCCUPATION}

Select Category
    [Arguments]    ${attr}=index
    ${val}=     Return Random Number Limit      end=15
    Click Button    ${FIELD_CATEGORY}
    Select Options By    ${FIELD_CATEGORY}    ${attr}    ${val}
    Keyboard Key    press    Enter

Click Add
    Click Button        ${BTN_ADD}

Click Upload File
    Click Button        ${BTN_UPLOAD_FILE}

Click Done
    Click Button    ${BTN_DONE}
