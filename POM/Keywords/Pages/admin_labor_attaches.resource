*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminLaborAttachesLocators.py


*** Keywords ***
Open Admin Labor Attaches Page
    Open Page    base_url=${ADMIN_URL}    page_url=labor-attaches

Click Btn New Attache
    Click Button    ${BTN_NEW_ATTACHE}

Select Country
    [Arguments]    ${locator}
    Click Button    ${locator}
    Click Button    ${SELECT_COUNTRY}

Click Btn Send Invitation
    Click Button    ${BTN_SEND_INVITATION}

Click Btn Ok
    Click Button    ${BTN_OK}

Click Icon Resend
    Hover    ${ICON_DOTS}
    Click Button    ${ICON_RESEND_ACTION}

Click Btn Yes
    Click Button    ${BTN_YES}

Click Filter Icon
    Click Button    ${FILTER_ICON}

Click Btn Apply
    Click Button    ${BTN_APPLY}

Click Btn Clear
    Click Button    ${BTN_CLEAR}
