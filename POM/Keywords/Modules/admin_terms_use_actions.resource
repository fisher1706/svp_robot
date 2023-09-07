*** Settings ***
Resource        POM/Keywords/Pages/admin_terms_use.resource
Resource        POM/Keywords/Pages/base.resource
Variables       Resources/Variables/SuccessMessage.py
Variables       POM/Locators/AdminTermsUseLocators.py


*** Keywords ***
Test Read And Edit Data Term Of Use Page
    Admin Terms Use Content Actions
    Read Data Term Of Use Page
    Click Btn Arabic
    Read Data Term Of Use Page
    Edit Data Term Of Use Page

Admin Terms Use Content Actions
    Open Admin Terms Use Content
    Wait Spinners To Disappear
    Wait For Elements State     ${TERMS_OF_USE_TEXT}       visible

Read Data Term Of Use Page
    ${elements}=    Get Elements    ${DATA_FIELD}
    FOR    ${el}    IN      @{elements}
        ${state}=    Get Element States      ${el}      then    bool(value & visible)
        IF      ${state}
            ${text}=    Get Text    ${el}
            Should Not Be Empty     ${text}
        END
    END

Edit Data Term Of Use Page
    Activate Field Content
    Click Btn Save Changes
    Verify Text    ${SUCCESS_UPDATE}        ${SUCCESS_UPDATE_CONTENT}
    Click Btn Ok
