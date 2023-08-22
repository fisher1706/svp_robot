*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminCategoriesLocators.py


*** Keywords ***
Open Admin Categories Page
    Open Page    base_url=${ADMIN_URL}    page_url=categories

Click New Category
    Click Button    ${BTN_NEW_CATEGORY}

Click Btn Save
    Click Button    ${BTN_SAVE}

Click Btn Change Logs
    Click Button    ${CHANGE_LOGS}

Click Btn Edit
    Click Button    ${BTN_EDIT}

Verify Create Category Button Is Dissabled
    Wait For Elements State    ${BTN_SAVE_CATEGORY}    disabled

Click Upload Categories
    Click Button    ${BTN_UPLOAD_CATEGORIES}

Click Done
    Click Button    ${BTN_DONE}

Click Btn Back
    Click Button    ${BTN_BACK}

Select Category Status
    [Arguments]     ${status}
    Click Button    ${SELECT_CATEGORY_STATUS}
    Select Options By    ${SELECT_CATEGORY_STATUS}    text    ${status}
    Keyboard Key    press    Enter
