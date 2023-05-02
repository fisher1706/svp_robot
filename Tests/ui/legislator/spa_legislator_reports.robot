*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_reports_action.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Create Entities And Log In
...     is_legislator_activate=True
...     login_tcenter=False
...     is_tcenter=True


*** Test Cases ***
Checking the ability to search entry by filters and clear filters on Reports tab
    Test Legislator Check Filters And Clear Filters Reports Tab

Checking the certificate is valid scenario
    Test Legislator Valid Scenario

Checking the certificate is expired scenario
    Test Legislator Certificate Is Expired

Checking the passport number is valid but its not for the certificate entered serial number scenario
    Test Legislator Wrong Certificate

Checking the passport number does not match for this certificate serial number scenario
    Test Legislator Wrong Passport Number

Checking the certificate does not exist scenario
    Test Legislator Certificate Does Not Exist

Check the ability to download certificate as a Legislator on Reports tab
    Verify Download Certificate Report      is_reports_tab=True

Check the ability to download report as a Legislator
    Verify Download Certificate Report      is_certificate=False    is_reports_tab=True

Check the ability to download report on view payment details as a Legislator
    Verify Download Certificate Report      is_certificate=False    is_reports_tab=True     is_view_payment=True
