*** Settings ***
Library         Browser
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/SPAReportsLocator.py


*** Keywords ***
Click Reports
    Click Button    ${BTN_REPORTS}
