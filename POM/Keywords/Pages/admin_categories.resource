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