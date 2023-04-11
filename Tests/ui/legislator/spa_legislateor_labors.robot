*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_upload_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/SetPasswordDataset.py

Test Setup    Open Chrome Browser


*** Variables ***
${TEST_CENTER}      Autotest iffulsvf
${OCCUPATION}       Engine Mechanics
${PAGES}            10
${ENTITY}           legislator

#qiwaqa+svp-ckhhehtt@p2h.com
*** Test Cases ***
Checking validation of edit email field on Labors tab
    Create Entities And Log In
    ...     is_legislator_activate=True
    ...     login_tcenter=False
    Add TCentr
#    Sleep   120
#
#    Upload Group Of Labors      ${ENTITY}       ${TEST_CENTER}     ${OCCUPATION}

#C6488 Check the ability to add individual labor with valid data
#    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
#    Add Individual Labor    ${ENTITY}       ${TEST_CENTER}       ${OCCUPATION}
#
#C6087 C6088 C6089 Checking the ability to upload csv file without selected Category and Test Center
#    Create Entities And Log In   is_legislator_activate=True     login_tcenter=False
#    Verify Upload Csv File Without Selected Category And Tcenter    ${ENTITY}     ${TEST_CENTER}     ${OCCUPATION}
#
#C9121 C9126 Checking the ability to search entry by filters and clear filters on Upload Files table
#    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
#    Verify Filters On Uploads Tab       ${ENTITY}       ${TEST_CENTER}     ${OCCUPATION}
#
#Checking pagination and search result value as Legislator on Upload tab
#    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
#    Verify Total Amount Value       ${ENTITY}       ${PAGES}       ${TEST_CENTER}     ${OCCUPATION}
#
#Checking the ability to download csv sample
#    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
#    Verify Download Csv Sample      ${ENTITY}
