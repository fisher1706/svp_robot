*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_upload_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/SetPasswordDataset.py

Test Setup    Open Chrome Browser


*** Variables ***
${TEST_CENTER}      CSC Delhi
${OCCUPATION}       Welding
${PAGES}            10
${ENTITY}           tcentr


*** Test Cases ***
C6090 Checking the ability to upload csv file with selected Test Center and Categories
    Create Entities And Log In      is_tcenter_activate=True
    Upload Group Of Labors      ${ENTITY}       ${TEST_CENTER}     ${OCCUPATION}

C6488 Check the ability to add individual labor with valid data as a Test Center
    Create Entities And Log In      is_tcenter_activate=True
    Add Individual Labor    ${ENTITY}       ${TEST_CENTER}       ${OCCUPATION}

C6087 C6088 C6089 Checking the ability to upload csv file without selected Category and Test Center
    Create Entities And Log In      is_tcenter_activate=True
    Verify Upload Csv File Without Selected Category And Tcenter    ${ENTITY}     ${TEST_CENTER}     ${OCCUPATION}

C9121 C9126 Checking the ability to search entry by filters and clear filters on Upload Files table
    Create Entities And Log In      is_tcenter_activate=True
    Verify Filters On Uploads Tab       ${ENTITY}       ${TEST_CENTER}     ${OCCUPATION}

Checking pagination and search result value as Test Center on Upload tab
    Create Entities And Log In      is_tcenter_activate=True
    Verify Total Amount Value       ${ENTITY}       ${PAGES}       ${TEST_CENTER}     ${OCCUPATION}

Checking the ability to download csv sample
    Create Entities And Log In      is_tcenter_activate=True
    Verify Download Csv Sample      ${ENTITY}
