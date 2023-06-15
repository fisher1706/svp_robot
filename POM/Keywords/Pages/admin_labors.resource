*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Library             String
Library             Libraries/Utils.py
Variables           POM/Locators/AdminLaborsLocators.py


*** Keywords ***
Click Users
    Click Button    ${BTN_USERS}

Click Labors
    Click Button    ${LABORS}

Open Admin Labors Page
    Open Page    base_url=${ADMIN_URL}    page_url=registered-labors

Click Next
    Click Button    ${BTN_NEXT}

Click Yes
    Click Button    ${BTN_YES}

Click Filters Admin
    Click Button    ${BTN_FILTERS}

Click Back
    Click Button    ${BTN_BACK}

Click Certificates
    Click Button    ${BTN_CERTIFICATES}

Click Filters
    Click Button    ${BTN_FILTERS}

Click Apply
    Click Button    ${BTN_APPLY}

Click Clear
    Click Button    ${BTN_CLEAR}
