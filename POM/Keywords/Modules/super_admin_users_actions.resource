*** Settings ***
Resource        POM/Keywords/Pages/super_admin_users.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Resources/DataSources/models/ModelBuilder.py
Library         Libraries/Utils.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/SuperAdminTestData.py


*** Keywords ***
Test Add New User To SVP
    [Arguments]    ${user_type}=Admin       ${email}=${EMPTY}
    Open Admin Users Page
    Click Btn Invite New User
    ${locator}=     Create User Locator Super Admin     ${user_type}
    Click Button    ${locator}
    IF      '${email}'=='${EMPTY}'
        ${email}=   Create Random Email
        Fiel Field Enter User Email Address     email=${email}
        Click Btn Send Invitation
        Click Btn Ok
        Verify Added User   email=${email}       user_type=${user_type}
    ELSE
        Fiel Field Enter User Email Address     email=${email}
        Verify Text    ${WARNING_FIELD_INVALID_EMAIL}      ${MSG_INVALID_EMAIL_ADMIN}
    END

Test Ability Resend Invitation
    [Arguments]    ${type}=positive
    Test Add New User To SVP
    Choose Open Action      actions_locator=${LAST_ACTIONS}     actions_type=Resend
    IF      '${type}'=='positive'
        Click Btn Yes
    ELSE
        Click Btn No
    END

Test Ability Revoke Users With Active Statuses
    [Arguments]    ${type}=positive
    Set User Status     status=Active
    Choose Open Action      actions_locator=${NECESSARY_ACTIONS}      actions_type=Revoke
    IF      '${type}'=='positive'
        Click Btn Yes
    ELSE
        Click Btn No
    END
    Verify Admin Revoked Status      type=${type}

Test Ability Reactivate Users With Revoked Statuses
    [Arguments]    ${type}=positive
    Set User Status     status=Revoked
    Choose Open Action      actions_locator=${NECESSARY_ACTIONS}      actions_type=Reactivate
    IF      '${type}'=='positive'
        Click Btn Yes
    ELSE
        Click Btn No
    END
    Verify Admin Reactivate Status      type=${type}

Test Ability Edit Assigned Role For User
    Set User Status     status=Active
    ${role}=    Edit User Role
    Verify Edited User      choosed_role=${role}
    ${role}=    Edit User Role      random_role=False
    Verify Edited User      choosed_role=${role}

Edit User Role
    [Arguments]    ${random_role}=True
    Choose Open Action      actions_locator=${NECESSARY_ACTIONS}      actions_type=Edit Role
    Wait For Elements State    ${CHOOSE_A_ROLE_TEXT}        visible
    ${roles}=       Get Last Entry    ${OPEN_ROLES}
    IF    ${random_role}
        ${role}=        Return Random Data List     ${roles}[1: -1]
    ELSE
        ${role}=    Set Variable    ${roles}[0]
    END
    ${locator}=     Create Role Locator Super Admin     data=${role}
    Click Button    ${locator}
    Click Btn Save
    Click Btn Ok
    RETURN      ${role}

Verify Edited User
    [Arguments]    ${choosed_role}
    Wait For Elements State    ${BTN_OK}        hidden
    Verify Text    ${NECESSARY_ROLE}      ${choosed_role}

Verify Added User
    [Arguments]    ${email}     ${user_type}
    Open Admin Users Page
    Reload
    ${entry}=   Get Last Entry    ${LAST_ENTRY}
    Should Be Equal    ${email}     ${entry}[1]
    Should Be Equal    ${user_type}     ${entry}[2]

Find Necessary User
    ${element}=    Get Elements    ${NECESSARY_USER}
    IF    ${element}
        RETURN
    ELSE
        WHILE   not(${element})     limit=${LIMIT}
            Click Next
            ${element}=    Get Elements    ${NECESSARY_USER}
        END
        RETURN
    END

Verify Admin Revoked Status
    [Arguments]     ${type}
    IF      '${type}'=='positive'
        Verify Text     ${NECESSARY_STATUS}     Revoked
    ELSE
        Verify Text     ${NECESSARY_STATUS}     Active
    END

Set User Status
    [Arguments]    ${status}
    Open Admin Users Page
    Find Necessary User
    ${user_status}=      Get Text        ${NECESSARY_STATUS}
    IF    '${status}'!='${user_status}'
        IF      '${user_status}'=='Revoked'
            Choose Open Action      actions_locator=${NECESSARY_ACTIONS}      actions_type=Reactivate
        ELSE IF     '${user_status}'=='Active'
            Choose Open Action      actions_locator=${NECESSARY_ACTIONS}      actions_type=Revoke
        END
        Click Btn Yes
    END

Verify Admin Reactivate Status
    [Arguments]     ${type}
    IF      '${type}'=='positive'
        Verify Text     ${NECESSARY_STATUS}     Active
    ELSE
        Verify Text     ${NECESSARY_STATUS}     Revoked
    END
