*** Settings ***
Resource    Resources/Variables/variables.resource
Library     Browser


*** Keywords ***
Open Chrome Browser
    [Arguments]  ${browser}=chromium  ${timeout}=30s
    Set Common Global Variables
    New Browser     browser=${browser}  headless=false   args=["--start-maximized", "--no-sandbox", "--disable-dev-shm-usage", "--disable-gpu"]
    Set Browser Timeout    ${timeout}
    New Context     viewport=${None}
    New Page
