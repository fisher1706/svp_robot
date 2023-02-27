*** Settings ***
Library    Browser
Library     Collections
Variables   ../../Locators/BaseLocators.py

*** Keywords ***
Verify message
    [Arguments]     ${locator}  ${expected_message}
    Wait For Elements State      ${locator}  visible
    Get Text    ${locator}  should be  ${expected_message}
