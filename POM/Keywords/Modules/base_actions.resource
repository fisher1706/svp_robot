*** Settings ***
Library         Collections
Library         Browser
Variables       POM/Locators/BaseLocators.py


*** Keywords ***
Verify Text
    [Arguments]    ${locator}=${EMPTY}    ${expected_message}=''    ${timeout}=30s    ${is_equal}=True
    Wait For Elements State    selector=${locator}    state=visible    timeout=${timeout}
    IF    ${is_equal}
        Get Text    ${locator}    ==    ${expected_message}
    ELSE
        Get Text    ${locator}    contains    ${expected_message}
    END

Click Button
    [Arguments]    ${locator}    ${state}=enabled
    Wait For Elements State    ${locator}    ${state}
    Click    ${locator}
