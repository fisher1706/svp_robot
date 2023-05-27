*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_payment_actions.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True


*** Test Cases ***
C10345 Check the ability to add credits as a Test Center
    Test Get Credits

C10346 Check the ability to verify input fields on add credits as a Test Center
    Test Get Verify Input Fields On Add Credits

Check number of labors and total amount on payment tab as a Test Center
    Test Number Of Labors And Total Amount Counters

Check the ability to download certificate as a Test Center
    Test Download Certificate

Check Payment Confirmation info and Transaction Information as a Test Center
    Test Payment Info

Check the ability to download invoice after passing get credits flow as a Test Center
    Test Invoice After Passing Get Credits Flow
