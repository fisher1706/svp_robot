*** Settings ***
Library         Resources/DataSources/models/ModelBuilder.py
Resource        POM/Keywords/Modules/login_actions.resource
Resource        POM/Keywords/Pages/admin_test_centers.resource
Variables       POM/Locators/BaseLocators.py
Variables       Resources/Variables/Titles.py
Variables       Resources/Variables/SuccessMessage.py


*** Keywords ***
Fill Test Center Form
    [Arguments]    ${account}    ${legislator_name}
    Log To Console    ${account.email}
    Fill Name    ${account.en_name}
    Select Dropdown County    ${account.country}
    # TODO: Need to add method for adding category for specific country
    Select Dropdown Category    ${account.category}
    Fill City    ${account.city}
    Fill Address    ${account.address}
    Fill Phone    ${account.sub_number}
    Select Legislator    ${legislator_name}
    Fill Test Center Owner Name    ${account.contact_name}
    Fill Email    ${account.email}
    Click Button Create Test Center

Verify Error Message On Test Center Create
    [Arguments]
    ...    ${legislator}=Autotest
    ...    ${msg}=''
    ...    ${is_name}=False
    ...    ${name}='' ${is_email}=False
    ...    ${email}=''
    ${account}=    Create New Account
    Log In By Api To The Admin Portal
    Open Test Centers Page
    Click Btn New Test Center
    Verify Title New Test Center
    ${account.en_name}=    Set Variable If    ${is_name}    ${name}
    ${account.email}=    Set Variable If    ${is_email} ${email}
    Fill Test Center Form    ${account}    ${legislator}
    Verify Warning Message    ${msg}

Verify Tcenters View Fields
    [Arguments]    ${account}    ${legislator_name}
    Log To Console    ${account}
    Verify Name In Title    ${account.en_name}
    Verify Name    ${account.en_name}
    Verify Adress    ${account.address}
    Verify Category    ${account.category}
    Verify Country    ${account.country}
    Verify City    ${account.city}
    Verify Status
    Verify Phone Number    ${account.phone_number}
    Verify Legislator    ${legislator_name}
    Verify Test Center Owner Name    ${account.contact_name}
    Verify Test Center Owner Email    ${account.email}
