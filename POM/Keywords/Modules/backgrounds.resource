*** Settings ***
Library     Libraries/Api/features/auth_api.py
Library     Resources/DataSources/models/ModelBuilder.py
Library     Libraries/Api/actions/AdminApiActions.py
Resource    POM/Keywords/Pages/password.resource
Resource    POM/Keywords/Modules/admin_tcenters_actions.resource
Variables   POM/Locators/BaseLocators.py
Variables   Resources/Variables/Titles.py
Variables   Resources/Variables/SuccessMessage.py


*** Keywords ***
Activate Account And Set Password
    [Arguments]    ${is_tcenter}
    Activate Account    ${is_tcenter}
    Enter Password On Password Form     ${DEFAULT_PASSWORD}
    Enter Confirmed Password    ${DEFAULT_PASSWORD}
    Verify Password Title

Create Entities And Log In
    [Arguments]     ${is_legislator}=True   ${is_legislator_activate}=False     ${is_tcenter}=False     ${is_tcenter_activate}=False    ${login}=True   ${login_tcenter}=True   ${is_multiple_categories}=False  ${two_factor_verification}=''
    Request Token
    ${token}=   Get Token
    Put Permissions     token=${token}    tcenter=${login_tcenter}    multiple_categories=${is_multiple_categories}
    IF     ${is_legislator}
        Create Legislator   ${token}
        IF  ${is_legislator_activate}
            ${legislator_account}=  Get Legislator Account
            Activate Account And Set Password   ${legislator_account.email}
        END
    END
    IF  ${is_tcenter}
        Create Test Center    ${token}
        ${tcenter_name}=    Get Test Center Account
        IF  ${is_tcenter_activate}
            Activate Account And Set Password   ${tcenter_name.email}
        END
    END
    IF  ${login}
        ${email}=   Set Variable If     ${login_tcenter}    ${tcenter_name.email} ${legislator_account.email}
        Log In To SPA   ${email}  ${two_factor_verification}
    END
