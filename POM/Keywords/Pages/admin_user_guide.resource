*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           Resources/Variables/DirPath.py
Variables           POM/Locators/AdminUserGuideLocators.py


*** Keywords ***
Open Admin User Guide Page
    Open Page    base_url=${ADMIN_URL}    page_url=user-guide

Click Btn Edit
    Click Button    ${BTN_EDIT}

Click Remove Icon
    Click Button    ${ICON_REMOVE}

Click Btn Add User Guide
    Click Button    ${BTN_ADD_USER_GUIDE}

Upload User Guide File
    [Arguments]     ${file}
    Upload File By Selector    ${BTN_CHOOSE_FILE}    ${file}
    Wait For Elements State    ${BTN_ADD_USER_GUIDE}    enabled
    Click Btn Add User Guide
    Wait For Elements State     ${BTN_EDIT}       visible
