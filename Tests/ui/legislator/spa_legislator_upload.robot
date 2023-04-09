*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_upload_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/SetPasswordDataset.py


Test Setup    Open Chrome Browser


*** Variables ***
${test_center}      Autotest iffulsvf
${occupation}       Engine Mechanics
${pages}            10
${entity}           legislator


*** Test Cases ***
C6090 Checking the ability to upload csv file with selected Test Center and Categories
#    Log In With Valid Login And Password        ${ALARM_LOGIN_LEGISLATOR}
    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
    Upload Group Of Labors      ${entity}       ${test_center}     ${occupation}

C6488 Check the ability to add individual labor with valid data
#    Log In With Valid Login And Password        ${ALARM_LOGIN_LEGISLATOR}
    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
    Add Individual Labor    ${entity}       ${test_center}       ${occupation}

C6087 C6088 C6089 Checking the ability to upload csv file without selected Category and Test Center
#    Log In With Valid Login And Password        ${ALARM_LOGIN_LEGISLATOR}
    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
    Verify Upload Csv File Without Selected Category And Tcenter    ${entity}     ${test_center}     ${occupation}

C9121 C9126 Checking the ability to search entry by filters and clear filters on Upload Files table
#    Log In With Valid Login And Password        ${ALARM_LOGIN_LEGISLATOR}
    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
    Verify Filters On Uploads Tab       ${entity}       ${test_center}     ${occupation}

Checking pagination and search result value as Legislator on Upload tab
#    Log In With Valid Login And Password        ${ALARM_LOGIN_LEGISLATOR}
    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
    Verify Total Amount Value       ${entity}       ${pages}       ${test_center}     ${occupation}

Checking the ability to download csv sample
#    Log In With Valid Login And Password        ${ALARM_LOGIN_LEGISLATOR}
    Create Entities And Log In      is_legislator_activate=True     login_tcenter=False
    Verify Download Csv Sample      ${entity}
