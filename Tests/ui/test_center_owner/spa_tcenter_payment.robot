*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_payment_actions.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True


*** Test Cases ***
C10345 Check the ability to add credits as a Test Center
    Test Legislator Get Credits

C10346 Check the ability to verify input fields on add credits as a Test Center
    Test Legislator Get Verify Input Fields On Add Credits

Check number of labors and total amount on payment tab as a Test Center
    Test Legislator Number Of Labors And Total Amount Counters

Check the ability to download certificate as a Test Center
    Test Legislator Download Certificate

Check Payment Confirmation info and Transaction Information as a Test Center
    Test Legislator Payment Info

Check the ability to download invoice after passing get credits flow as a Test Center
    Test Legislator Invoice After Passing Get Credits Flow
