*** Settings ***
Library         Collections
Library         Browser
Variables       POM/Locators/BaseLocators.py


*** Keywords ***
Verify Text
    [Arguments]    ${locator}    ${expected_message}    ${is_equal}=True
    Wait For Elements State    ${locator}    visible
    IF    ${is_equal}
        Get Text    ${locator}    ==    ${expected_message}
    ELSE
        Get Text    ${locator}    contains    ${expected_message}
    END

Click Button
    [Arguments]    ${locator}    ${state}=enabled
    Wait For Elements State    ${locator}    ${state}
    Click    ${locator}
