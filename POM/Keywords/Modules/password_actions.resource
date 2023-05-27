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

Open Activation Page Link
    [Arguments]    ${is_tcenter}
    IF    ${is_tcenter}
        ${account}=    Get Test Center Account
    ELSE
        ${account}=    Get Legislator Account
    END
    ${url}=    Set Variable     ${account.activation_link}
    Go To    ${SPA_URL}${url}

Enter Login And Password On Password Form
    [Arguments]    ${password}=${DEFAULT_PASSWORD}    ${confirm_password}=${DEFAULT_PASSWORD}
    Enter Password Activate    ${password}
    Enter Confirmed Password Activate    ${confirm_password}
    Click Continue Button

Verify Password With Invalid Data
    [Arguments]    ${invalid_passwords}    ${is_tcenter}=True
    # TODO: Use "Open Activation Page" when email service will work
    Open Activation Page Link       ${is_tcenter}
    Enter Password Activate    ${invalid_passwords[0]}
    Enter Confirmed Password Activate    ${invalid_passwords[1]}
    Verify Continue Button Is Dissabled

Verify Password Validation
    [Arguments]     ${is_tcenter}=False
    # TODO: Use "Get Confirmation Url + Go To" when email service will work
    Open Activation Page Link       is_tcenter=${is_tcenter}
    Enter Login And Password On Password Form
    Verify Message Token Warning
