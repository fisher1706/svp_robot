*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_upload_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/SetPasswordDataset.py

Test Setup    Run Keywords    Open Chrome Browser
...           AND     Create Entities And Log In        is_legislator_activate=True     login_tcenter=False


*** Variables ***
${PAGES}            10
${ENTITY}           legislator


*** Test Cases ***
C6090 Checking the ability to upload csv file with selected Test Center and Categories
    ${tcenter}      ${occupation}       Add TCentr
    Upload Group Of Labors      ${tcenter}     ${occupation}

C6488 Check the ability to add individual labor with valid data
    ${tcenter}      ${occupation}       Add TCentr
    Add Individual Labor    ${ENTITY}       ${tcenter}       ${occupation}

C6087 C6088 C6089 Checking the ability to upload csv file without selected Category and Test Center
    ${tcenter}      ${occupation}       Add TCentr
    Verify Upload Csv File Without Selected Category And Tcenter    ${tcenter}     ${occupation}

C9121 C9126 Checking the ability to search entry by filters and clear filters on Upload Files table
    ${tcenter}      ${occupation}       Add TCentr
    Verify Filters On Uploads Tab       ${tcenter}     ${occupation}

Checking pagination and search result value as Legislator on Upload tab
    ${tcenter}      ${occupation}       Add TCentr
    Verify Total Amount Value       ${PAGES}       ${tcenter}     ${occupation}

Checking the ability to download csv sample
    ${tcenter}      ${occupation}       Add TCentr
    Verify Download Csv Sample
