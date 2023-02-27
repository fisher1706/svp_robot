*** Settings ***
Resource    ../Variables/variables.resource
Library     Browser


*** Keywords ***
Open Chrome Browser
    [Arguments]  ${browser}=chromium  ${timeout}=30s  ${viewport_width}=1600  ${viewport_height}=900
    Set Common Global Variables
    Open Browser     browser=${browser}
    Set Browser Timeout    ${timeout}
    Set Viewport Size    width=${viewport_width}    height=${viewport_height}
