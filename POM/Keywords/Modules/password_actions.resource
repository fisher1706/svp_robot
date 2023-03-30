*** Settings ***
Library         Libraries/email/EmailClient.py
Library         Libraries/Api/actions/AdminApiActions.py
Variables       POM/Locators/LoginLocators.py
Variables       Resources/Variables/Titles.py
Variables       Resources/Variables/SetPasswordDataset.py
Variables       Resources/Variables/UserInfo.py
Resource        POM/Keywords/Pages/password.resource
Resource        POM/Keywords/Pages/base.resource


*** Keywords ***
Open Activation Page
    [Arguments]    ${is_tcenter}=False    ${email}=${EMPTY}
    IF    '${email}'=='${EMPTY}'
        IF    ${is_tcenter}
            ${account}=    Get Test Center Account
        ELSE
            ${account}=    Get Legislator Account
        END
        ${email}=    Set Variable    ${account.email}
    END
    Parse Context Email    ${email}
    ${url}=    Get Confirmation Url
    Go To    ${url}

Enter Login And Password On Password Form
    [Arguments]    ${password}=${DEFAULT_PASSWORD}    ${confirm_password}=${DEFAULT_PASSWORD}
    Enter Password Activate    ${password}
    Enter Confirmed Password Activate    ${confirm_password}
    Click Continue Button

Verify Password With Invalid Data
    [Arguments]    ${is_tcenter}=True
    Open Activation Page    ${is_tcenter}
    FOR    ${password}    IN    @{INVALID_PASSWORD_LIST}
        Enter Password Activate    ${password[0]}
        Enter Confirmed Password Activate    ${password[1]}
        Verify Continue Button Is Dissabled
    END

Verify Password Validation
    ${url}=    Get Confirmation Url
    Go To    ${url}
    Enter Login And Password On Password Form
    Verify Message Token Warning
