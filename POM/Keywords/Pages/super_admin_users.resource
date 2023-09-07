*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Library             Libraries/LocatorFunction.py
Variables           POM/Locators/SuperAdminUsersLocators.py


*** Keywords ***
Open Admin Users Page
    Open Page    base_url=${ADMIN_URL}    page_url=admins
    Wait Spinners To Disappear
    Wait For Elements State    ${ADMIN_USERS_TEXT}      visible

Click Btn Invite New User
    Click Button    ${BTN_INVITE_NEW_USER}

Fiel Field Enter User Email Address
    [Arguments]    ${email}
    Type Text    ${FIELD_ENTER_USER_EMAIL_ADDRESS}        ${email}

Click Btn Send Invitation
    Click Button    ${BTN_SEND_INVITATION}

Click Btn Ok
    Click Button    ${BTN_OK}

Choose Open Action
    [Arguments]    ${actions_locator}       ${actions_type}
    Hover       ${actions_locator}
    IF    '${actions_type}'=='Resend'
        ${locator}=     Create Open Actions Locator Super Admin Resend      locator=${actions_locator}
        Click Button    ${locator}
    ELSE
        ${locator}=     Create Open Actions Locator Super Admin
        ...     base_locator=${actions_locator}       action_type=${actions_type}
        Click Button    ${locator}
    END

Click Btn Yes
    Click Button    ${BTN_YES}

Click Btn No
    Click Button    ${BTN_NO}

Click Next
    Click Button    ${BTN_NEXT}

Click Btn Save
    Click Button    ${BTN_SAVE}
