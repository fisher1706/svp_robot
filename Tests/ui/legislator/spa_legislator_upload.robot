*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_upload_actions.resource
Variables           Resources/Variables/Authentication.py
Variables           Resources/Variables/SetPasswordDataset.py

Test Setup    Run Keywords    Open Chrome Browser   AND     Create Entities And Log In
...     is_legislator_activate=True
...     login_tcenter=False
...     is_tcenter=True


*** Variables ***
${ENTITY}           legislator


*** Test Cases ***
C6090 Checking the ability to upload csv file with selected Test Center and Categories
    Upload Group Of Labors Index

C6488 Check the ability to add individual labor with valid data
    Add Individual Labor    ${ENTITY}

C6087 C6088 C6089 Checking the ability to upload csv file without selected Category and Test Center
    Verify Upload Csv File Without Selected Category And Tcenter

C9121 C9126 Checking the ability to search entry by filters and clear filters on Upload Files table
    Verify Filters On Uploads Tab

Checking pagination and search result value as Legislator on Upload tab
    Verify Total Amount Value

Checking the ability to download csv sample
    Verify Download Csv Sample
