*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_upload_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/SetPasswordDataset.py

Test Setup    Run Keywords    Open Chrome Browser
...           AND     Create Entities And Log In        is_tcenter_activate=True     is_tcenter=True


*** Variables ***
${PAGES}            10
${ENTITY}           tcentr


*** Test Cases ***
C6090 Checking the ability to upload csv file with selected Test Center and Categories
    ${tcenter}      ${occupation}       Add TCentr
    Upload Group Of Labors      ${TEST_CENTER}     ${OCCUPATION}

C6488 Check the ability to add individual labor with valid data as a Test Center
    ${tcenter}      ${occupation}       Add TCentr
    Add Individual Labor    ${ENTITY}       ${TEST_CENTER}       ${OCCUPATION}

C6087 C6088 C6089 Checking the ability to upload csv file without selected Category and Test Center
    ${tcenter}      ${occupation}       Add TCentr
    Verify Upload Csv File Without Selected Category And Tcenter    ${TEST_CENTER}     ${OCCUPATION}

C9121 C9126 Checking the ability to search entry by filters and clear filters on Upload Files table
    ${tcenter}      ${occupation}       Add TCentr
    Verify Filters On Uploads Tab       ${TEST_CENTER}     ${OCCUPATION}

Checking pagination and search result value as Test Center on Upload tab
    ${tcenter}      ${occupation}       Add TCentr
    Verify Total Amount Value       ${PAGES}       ${TEST_CENTER}     ${OCCUPATION}

Checking the ability to download csv sample
    ${tcenter}      ${occupation}       Add TCentr
    Verify Download Csv Sample
