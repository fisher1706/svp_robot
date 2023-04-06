*** Settings ***
Library         Libraries/Api/actions/AdminApiActions.py
Library         Resources/DataSources/models/ModelBuilder.py
Resource        POM/Keywords/Pages/spa_account.resource
Resource        POM/Keywords/Pages/base.resource
Variables       Resources/Variables/WrongTestCenterDataset.py


*** Keywords ***
Verify Account Information
    [Arguments]    ${account}=False    ${is_logo}=False
    IF    ${account}==False    # robocop: disable=inline-if-can-be-used
        ${account}=    Get Legislator Account
    END
    ${logo}=    Set Variable If    ${is_logo}    Yes    No
    # TODO: Add verification for logo image
    ${result}=    Get Show Logo
    Should Be Equal As Strings    ${result}    ${logo}
    ${result}=    Get Address
    Should Be Equal As Strings    ${result}    ${account.address}
    ${result}=    Get Postal Code
    Should Be Equal As Strings    ${result}    str(${account.postal_code})
    ${result}=    Get Full Name
    Should Be Equal As Strings    ${result}    ${account.contact_name}
    ${result}=    Get Phone Number
    Should Be Equal As Strings    ${result}    ${account.phone_number}
    ${result}=    Get Email
    Should Be Equal As Strings    ${result}    ${account.email}

Go To Edit Account Form
    Open Account Information Page
    Verify Title Account Information
    Wait Spinners To Disappear
    Click Edit Button

Verify View Account Information
    Go To Edit Account Form
    ${account}=    Get Legislator Account
    Should Not Be True    Get Show Logo    is_edit=True
    ${result}=    Get Address    is_edit=True
    Should Be Equal As Strings    ${result}    ${account.address}
    ${result}=    Get Postal Code    is_edit=True
    Should Be Equal As Strings    ${result}    ${account.postal_code}
    ${result}=    Get Full Name    is_edit=True
    Should Be Equal As Strings    ${result}    ${account.contact_name}
    ${result}=    Get Phone Number    is_edit=True
    Should Be Equal As Strings    ${result}    ${account.sub_number}
    ${result}=    Get Email    is_edit=True
    Should Be Equal As Strings    ${result}    ${account.email}

Verify Edit Account Information With Valid Data
    Go To Edit Account Form
    ${account}=    Create New Account
    Upload Logo File    ${account.logo}
    Select Show Logo Toggle
    Fill Address    ${account.address}
    Fill Postal Code    ${account.postal_code}
    Fill Full Name    ${account.contact_name}
    Fill Account Phone Number    ${account.sub_number}
    Fill Account Email    ${account.email}
    Click Save Button
    Verify Account Information    account=${account}

Verify Edit Account Information With Duplicate Email
    Go To Edit Account Form
    ${legislator_account}=    Get Legislator Account
    ${tcenter_account}=    Get Test Center Account
    Upload Logo File    ${legislator_account.logo}
    Fill Account Email    ${tcenter_account.email}
    Click Save Button
    Verify Warning Duplicate Email

Verify Edit Account Information With Empty Data
    Go To Edit Account Form
    Fill Address    \
    Fill Postal Code    \
    Fill Full Name    \
    Fill Account Phone Number    \
    Fill Account Email    \
    Verify Button Id Disabled

Verify Edit Account Information With Invalid Postal Code Field
    Go To Edit Account Form
    FOR    ${value}    IN    ${ACCOUNT_POSTAL_CODE}
        Fill Postal Code    ${value}
        Verify Warning Digits Only Postal Code
    END

Verify Edit Account Information With Invalid Name Field
    Go To Edit Account Form
    FOR    ${value}    IN    ${CONTACT_INFORMATION}
        Fill Full Name    ${value}
        Verify Warning En Chars Only Name
    END

Verify Edit Account Information With Invalid Contact Number Field
    Go To Edit Account Form
    FOR    ${value}    IN    ${OFFICIAL_CONTACT_NUMBER}
        Fill Account Phone Number    ${value}
        Verify Warning Digits Only Contact Number
    END

Verify Edit Account Information With Invalid Email Field
    Go To Edit Account Form
    FOR    ${value}    IN    ${ACCOUNT_EMAIL}
        Fill Account Email    ${value}
        Verify Warning Invalid Email Field
    END
