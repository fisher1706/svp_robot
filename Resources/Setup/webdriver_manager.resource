*** Settings ***
Resource    Resources/Variables/variables.resource
Library     Browser


*** Keywords ***
Open Chrome Browser
    [Arguments]    ${browser}=chromium    ${timeout}=30s
    Set Common Global Variables
    New Persistent Context
    ...    browser=${browser}
    ...    headless=True
    ...    args=["--no-sandbox", "--disable-dev-shm-usage", "--disable-gpu"]
    Set Browser Timeout    ${timeout}
