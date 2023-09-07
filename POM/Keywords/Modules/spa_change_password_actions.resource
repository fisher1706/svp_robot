*** Settings ***
Library         Libraries/Api/actions/AdminApiActions.py
Library         Resources/DataSources/models/ModelBuilder.py
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Pages/spa_change_password.resource
Resource        POM/Keywords/Pages/login.resource
Resource        POM/Keywords/Pages/spa_upload_files.resource
Resource        POM/Keywords/Pages/spa.resource
Variables       Resources/Variables/WrongTestCenterDataset.py
Variables       Resources/Variables/ChangePasswordDataset.py


*** Keywords ***
Verify View Change Password Form
    Click On Profile Menu
    Click Change Password
    Verify Title Change Password
    Click Back Button
    Verify Title Uploaded Files

Verify Change Password
    Open Change Password Page
    Fill Change Password Form    @{VALID_PASSWORD_LIST}
    Verify Sign In Title

Fill Change Password Form
    [Arguments]    @{password_list}    ${is_click}=True
    Open Change Password Page
    Fill Current Password    ${password_list[0]}
    Fill New Password    ${password_list[1]}
    Fill Confirmed New Password    ${password_list[2]}
    IF      ${is_click}
        Click Continue Button
    ELSE
        Verify Continue Button Is Dissabled
    END

Verify Change Password With Invalid Current Password
    Fill Change Password Form    @{INVALID_CURRENT_PASSWORD_LIST}
    Verify Warning Current Password

Verify Change Password With Current Password
    Fill Change Password Form    @{CURRENT_PASSWORD}
    Verify Warning New Password

Verify Change Password With Mismatch New Password
    Wait Until Keyword Succeeds    5x    1 sec    Open Change Password Page
    Fill Change Password Form    @{MISMATCH_NEW_PASSWORD}
    Verify Warning Confirm New Password

Verify Change Password With Invalid Confirm Password
    Fill Change Password Form    @{INVALID_CONFIRM_PASSWORD}
    Verify Warning Confirm New Password
