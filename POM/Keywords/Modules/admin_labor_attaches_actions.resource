*** Settings ***
Resource        POM/Keywords/Pages/admin_labor_attaches.resource
Resource        POM/Keywords/Pages/base.resource
Library         Resources/DataSources/models/ModelBuilder.py
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/ErrorMessage.py
Variables       POM/Locators/AdminLaborAttachesLocators.py


*** Keywords ***
Test Create New Attache
    [Arguments]    ${success}=True
    Admin Labor Attache Actions
    IF    ${success}
        ${labor}=   Create New Random Labor
        ${email}=   Set Variable    ${labor.email}
    ELSE
        ${email}=   Get Text    ${ADDED_EMAIL}
    END
    Click Btn New Attache
    Fill Invate Labor Attache    locator=${DROPDOWN_SELECT_COUNTRY}     email=${email}
    Click Btn Send Invitation
    IF    ${success}
        Verify Sent Invitation      status=${success}
        Click Btn Ok
    ELSE
        Verify Sent Invitation      status=${success}
    END

Test Resend Invitation
    Admin Labor Attache Actions
    Click Icon Resend
    Click Btn Yes
    Verify Sent Invitation      status=True

Test Use Filters
    Admin Labor Attache Actions
    Click Filter Icon
    Wait For Elements State    ${SELECT_COUNTRY_TEXT}      visible
    Click Btn Clear
    Select Country      ${SELECT_COUNTRY_FILTER}
    Click Btn Apply
    Verify Filters

Admin Labor Attache Actions
    Open Admin Labor Attaches Page
    Wait Spinners To Disappear
    Wait For Elements State     ${LABOR_ATTACHES_TEXT}      visible

Fill Invate Labor Attache
    [Arguments]    ${locator}      ${email}
    Select Country      locator=${locator}
    Type Text       ${FIELD_USER_EMAIL_ADDRESS}     ${email}

Verify Sent Invitation
    [Arguments]    ${status}
    IF    ${status}
        Wait For Elements State     ${SUCCESS_BOX}     visible
        Verify Text    ${SUCCESS_SEND}      ${MSG_SUCCESS_INVITATION}
    ELSE
        Wait For Elements State     ${ERROR_SEND}     visible
        Verify Text    ${ERROR_SEND}      ${MSG_WRONG_INVITATION}
    END

Verify Filters
    Wait Spinners To Disappear
    Verify Text    ${FILTER_CONTROL_TAG}      ${DEFAULT_COUNTRY}
