*** Settings ***
Resource        POM/Keywords/Pages/admin_landing_page.resource
Resource        POM/Keywords/Pages/base.resource
Library         Libraries/Utils.py
Variables       POM/Locators/AdminLandingPageLocators.py
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/LandingPageDefaultContent.py


*** Keywords ***
Test Edit Landing Page Content
    Admin Landing Page Content Actions
    ${section}=     Get Randon String
    ${content}=     Get Randon String
    Set Landing Page Content    section=${section}      content=${content}
    Set Landing Page Content    section=${SECTION_TITLE}      content=${CONTENT}

Admin Landing Page Content Actions
    Open Admin Landing Page Content
    Wait Spinners To Disappear
    Wait For Elements State     ${LANDING_PAGE_CONTENT_TEXT}       visible

Set Landing Page Content
    [Arguments]    ${section}       ${content}
    Click Btn Edit
    Type Text    ${FIELD_SECTION_TITLE}        ${section}
    Type Text    ${FIELD_CONTENT}        ${content}
    Click Btn Save
    Wait Spinners To Disappear
    Verify Text    ${SUCCESS_UPDATE}        ${SUCCESS_UPDATE_CONTENT}
    Click Btn Ok
