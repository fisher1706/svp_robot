*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminLogPageLocators.py


*** Keywords ***
Open Admin Actions Log Page
    Open Page    base_url=${ADMIN_URL}    page_url=logs

Choose Item Actions
    Hover       ${LAST_ACTION}
    Click Button        ${ICON_VIEW}

Click Btn Cancel
    Click Button    ${BTN_CANCEL}

Click Btn Seach
    Click Button    ${BTN_SEARCH}
