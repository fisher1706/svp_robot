*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_payment_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Create Entities And Log In
...     is_legislator_activate=True
...     login_tcenter=False
...     is_tcenter=True


*** Test Cases ***
C10345 Check the ability to add credits as a Legislator
    Test Legislator Get Credits

Check the ability to issue certificate as a Legislator
    Test Legislator Issue Certificate

C10346 Check the ability to verify input fields on add credits as a Legislator
    Test Legislator Get Verify Input Fields On Add Credits

Check number of labors and total amount counters on payment tab as a Legislator
    Test Legislator Number Of Labors And Total Amount Counters

Check the ability to download certificate as a Legislator
    Test Legislator Download Certificate

Check Payment Confirmation info and Transaction Information as a Legislator
    Test Legislator Payment Info

Check the ability to download invoice after passing get credits flow as a Legislator
    Test Legislator Invoice After Passing Get Credits Flow
