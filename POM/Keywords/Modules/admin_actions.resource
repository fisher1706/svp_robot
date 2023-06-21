*** Settings ***
Library         Resources/DataSources/models/ModelBuilder.py
Resource        POM/Keywords/Pages/dashboard.resource
Resource        POM/Keywords/Pages/admin_test_centers.resource
Resource        POM/Keywords/Pages/admin_legislators.resource
Resource        POM/Keywords/Modules/admin_tcenters_actions.resource
Variables       POM/Locators/BaseLocators.py
Variables       Resources/Variables/Titles.py
Variables       Resources/Variables/SuccessMessage.py


*** Keywords ***
Create New Test Center
    [Arguments]    ${legislator_name}=Autotest      ${permissions}=None
    Click Test Centers Tab
    Click Btn New Test Center
    Verify Title New Test Center
    ${account}=    Create New Account
    Fill Test Center Form    ${account}    ${legislator_name}
    Verify Title New Test Center    ${account.en_name}
    RETURN    ${account}

Create New Legislator
    ${account}=    Create New Account
    Fill Legislator Name    ${account.en_name}
    Upload Logo File    ${account.logo}
    Select Legislator Dropdown County    ${account.country}
    Fill Legislator City    ${account.city}
    Fill Legislator Address    ${account.address}
    Fill Contact Name    ${account.contact_name}
    Fill Phone Number    ${account.sub_number}
    Fill Legislator Email    ${account.email}
    Click Button Create Legislator
    Verify Title New Legislator    ${account.en_name}

Register New Legislator
    Click User Tab
    Verify Title Legislators
    Click Button New Legislators
    Verify Title New Legislator
    Create New Legislator
