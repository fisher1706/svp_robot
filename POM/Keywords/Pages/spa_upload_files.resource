*** Settings ***
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/LoginLocators.py
Variables       Resources/Variables/Titles.py


*** Keywords ***
Verify Title Uploaded Files
    Verify Text    locator=${SPA_HEADER}    expected_message=${UPLOADED_FILES}    timeout=60s
