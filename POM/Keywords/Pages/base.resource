*** Settings ***
Library         Browser
Variables       POM/Locators/BaseLocators.py
Variables       Resources/Variables/InfoMessages.py


*** Keywords ***
Open Page
    [Arguments]    ${base_url}=None    ${page_url}=None
    Go To    url=${base_url}${page_url}

Click Continue Button
    Click    selector=${CONTINUE_BUTTON}

Verify Continue Button Is Dissabled
    Get Element States    ${CONTINUE_BUTTON}    validate    value & disabled

Wait Continue Button To Become Disabled
    Wait For Elements State    ${CONTINUE_BUTTON}    disabled

Wait Spinners To Disappear
    Wait For Elements State    ${WAITING_SPINNER}    hidden

Wait Inner Spinners To Disappear
    Wait For Elements State    ${WAITING_INNER_SPINNER}    hidden       timeout=180s

# TODO: uncomment methods when needed in future tests
#@staticmethod
#def is_disabled(locator_name: str):
#    assert s(locator_name).should(have.value(''))
#
#def click_continue_btn(self, click_button=True):
#    element = s(self.CONTINUE_BUTTON)
#    if click_button:
#    element.should(be.clickable).click()
#    else:
#    element.should(be.disabled)

Verify No Data Available
    [Arguments]    ${spa}=True
    ${locator}=    Set Variable If    ${spa}    ${SPA_NO_DATA_AVAILABLE}    ${ADMIN_NO_DATA_AVAILABLE}
    Wait For Elements State    ${locator}
    Get Text    ${locator}    ==    ${NO_DATA_AVAILABLE}
