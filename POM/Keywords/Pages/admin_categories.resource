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

Click Chage Status
    Click Button    ${CHANGE_STATUS}

Click Upload Categories
    Click Button    ${BTN_UPLOAD_CATEGORIES}

Click Done
    Click Button    ${BTN_DONE}

Click Btn Publish
    Click Button    ${BTN_PUBLISH}

Click Btn Unpublish
    Click Button    ${BTN_UNPUBLISH}

Click Btn Back
    Click Button    ${BTN_BACK}

