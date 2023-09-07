*** Settings ***
Resource        POM/Keywords/Pages/admin_privacy_policy.resource
Resource        POM/Keywords/Pages/base.resource
Variables       POM/Locators/AdminPrivacyPolicyLocators.py


*** Keywords ***
Test Read And Edit Data Privacy Policy Page
    Admin Privacy Policy Actions
    Read Data Privacy Policy Page
    Activate Field Content
    Verify Btn Save Changes Active

Admin Privacy Policy Actions
    Open Admin Privacy Policy Content
    Wait Spinners To Disappear
    Wait For Elements State     ${PRIVACY_POLICY_PAGE_CONTENT_TEXT}       visible

Read Data Privacy Policy Page
    ${elements}=    Get Elements    ${DATA_FIELD}
    FOR    ${el}    IN      @{elements}
        ${text}=    Get Text    ${el}
        Should Not Be Empty     ${text}
    END
