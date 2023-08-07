*** Settings ***
Resource            POM/Keywords/Modules/login_actions.resource
Variables           Resources/Variables/UserInfo.py
Variables           Resources/Variables/LoginDataset.py


*** Keywords ***
Login To Spa Portal With Invalid Credentials
    [Arguments]    @{item}
    Open SPA Login Page
    Enter Login And Password    ${item}[0]    ${item}[1]
    Verify Login Error Msg    ${item}[2]
