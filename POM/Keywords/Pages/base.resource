*** Settings ***
Library    Browser
Variables   POM/Locators/BaseLocators.py
Variables   Resources/Variables/InfoMessages.py


*** Keywords ***
Open Page
    [Arguments]    ${base_url}=None    ${page_url}=None
    Go To  url=${base_url}${page_url}

Click Continue Button
    Click    selector=${CONTINUE_BUTTON}

# TODO: uncomment methods when needed in future tests
#def visit(self, **kwargs):
#    self.driver_actions.visit(kwargs.get('url'), kwargs.get('admin'))
#
#def wait_spinners_to_disappear(self):
#    s(self.WAITING_SPINNER).wait_until(be.not_.visible)
#    return self
#
#@staticmethod
#def is_disabled(locator_name: str):
#    assert s(locator_name).should(have.value(''))
#
#def click_continue_btn(self, click_button=True):
#    element = s(self.CONTINUE_BUTTON)
#    if click_button:
#        element.should(be.clickable).click()
#    else:
#        element.should(be.disabled)

Verify No Data Available
    [Arguments]    ${spa}=True
    ${locator}=   Set Variable If     ${spa}     ${SPA_NO_DATA_AVAILABLE}     ${ADMIN_NO_DATA_AVAILABLE}
    Wait For Elements State     ${locator}     visible
    Get Text    ${locator}    ==  ${NO_DATA_AVAILABLE}
