*** Settings ***
Library         Resources/DataSources/models/ModelBuilder.py
Library         Libraries/Api/actions/AdminApiActions.py
Library         Libraries/Api/actions/AuthApiActions.py
Resource        POM/Keywords/Modules/login_actions.resource
Variables       POM/Locators/BaseLocators.py
Variables       Resources/Variables/Titles.py
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/Authentication.py


*** Keywords ***
Create Entities And Log In
    [Arguments]
    ...    ${is_legislator}=True
    ...    ${is_legislator_activate}=False
    ...    ${is_tcenter}=False
    ...    ${is_tcenter_activate}=False
    ...    ${login}=True
    ...    ${login_tcenter}=True
    ...    ${is_multiple_categories}=False
    ...    ${two_factor_verification}=${AUTH_WEB}
    Request Token
    ${token}=    Get Token
    Put Permissions    token=${token}    tcenter=${login_tcenter}    multiple_categories=${is_multiple_categories}
    IF    ${is_legislator}
        Create Legislator    ${token}
        ${legislator_account}=    Get Legislator Account
        Log To Console    \nLegislator Email
        Log To Console    ${legislator_account.email}
        IF    ${is_legislator_activate}
            Activate Account And Set Password    ${legislator_account.email}      is_tcenter=False
        END
    END
    IF    ${is_tcenter}
        Create Test Center    ${token}
        ${tcenter_account}=    Get Test Center Account
        Log To Console    Test Center Owner Email
        Log To Console    ${tcenter_account.email}
        IF    ${is_tcenter_activate}
            Activate Account And Set Password    ${tcenter_account.email}     is_tcenter=True
        END
    END
    IF    ${login}
        ${email}=    Set Variable If    ${login_tcenter}    ${tcenter_account.email}    ${legislator_account.email}
        Log In To SPA    ${two_factor_verification}    ${email}
    END

Log In With Valid Login And Password
    [Arguments]     ${login}     ${password}=${DEFAULT_PASSWORD}
    Open SPA Login Page
    Enter Login And Password    ${login}    ${password}
    Proceed 2fa Web
