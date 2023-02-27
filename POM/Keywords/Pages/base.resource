*** Settings ***
Library    Browser
Variables   ../../Locators/BaseLocators.py

*** Keywords ***
Open page
    [Arguments]    ${base_url}      ${page_url}
    Go To  url=${base_url}${page_url}

Click Continue btn
    Click    selector=${CONTINUE_BUTTON}

def visit(self, **kwargs):
    self.driver_actions.visit(kwargs.get('url'), kwargs.get('admin'))

def refresh_page(self):
    time.sleep(1)
    self.driver_actions.refresh_page()
    time.sleep(1)
    return self

def wait_spinners_to_disappear(self):
    s(self.WAITING_SPINNER).wait_until(be.not_.visible)
    return self

@staticmethod
def is_disabled(locator_name: str):
    assert s(locator_name).should(have.value(''))

def click_continue_btn(self, click_button=True):
    element = s(self.CONTINUE_BUTTON)
    if click_button:
        element.should(be.clickable).click()
    else:
        element.should(be.disabled)
    return self

def verify_no_data_available(self, spa=True):
    no_data_available = s(self.SPA_NO_DATA_AVAILABLE) if spa else s(self.ADMIN_NO_DATA_AVAILABLE)
    no_data_available.wait_until(be.present)
    no_data_available.should(have.exact_text(InfoMessages.NO_DATA_AVAILABLE))
