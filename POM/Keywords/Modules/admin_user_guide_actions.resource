*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Pages/admin_user_guide.resource
Resource        POM/Keywords/Modules/admin_base_actions.resource
Library         String
Variables       POM/Locators/AdminUserGuideLocators.py


*** Keywords ***
Test Edit User Guide
    Admin User Guide Actions
    Edit User Guide Actions

Test Download User Guide
    Admin User Guide Actions
    Download File   filename=user_guide.pdf    btn_download=${FILE_USER_GUIDE}

Admin User Guide Actions
    Open Admin User Guide Page
    Wait Spinners To Disappear
    Wait For Elements State     ${USER_GUIDE_TEXT}       visible

Edit User Guide Actions
    ${user_guide_path}=    Set Variable    ${USER_GUIDE_FILE}
    @{worlds}=      Split String        ${user_guide_path}      /
    Click Btn Edit
    Wait For Elements State     ${USER_GUIDE_INFORMATION_TEXT}       visible
    Click Remove Icon
    Upload User Guide File      file=${user_guide_path}
    Verify Text    ${FILE_USER_GUIDE}       ${worlds}[-1]
