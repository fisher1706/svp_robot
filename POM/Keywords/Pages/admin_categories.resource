*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminCategoriesLocators.py


*** Keywords ***
Open Admin Categories Page
    Open Page    base_url=${ADMIN_URL}    page_url=categories

Click New Category
    Click Button    ${BTN_NEW_CATEGORY}

Click Create Category
    Click Button    ${BTN_CREATE_CATEGORY}

Select Status
    [Arguments]    ${attr}=index    ${val}=0
    Click Button    ${FIELD_STATUS}
    Select Options By    ${FIELD_STATUS}    ${attr}    ${val}
    Keyboard Key    press    Enter

Click Btn Create Category
    Click Button    ${BTN_CREATE_CATEGORY}

Click Btn Edit Category
    Click Button    ${BTN_EDIT_CATEGORY}

Verify Create Category Button Is Dissabled
    Wait For Elements State    ${BTN_CREATE_CATEGORY}    disabled

Click Chage Status
    Click Button    ${CHANGE_STATUS}

Click Upload Categories
    Click Button    ${BTN_UPLOAD_CATEGORIES}

Click Done
    Click Button    ${BTN_DONE}
