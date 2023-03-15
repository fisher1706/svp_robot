*** Settings ***
Library    Browser
Variables   POM/Locators/BaseLocators.py
Variables   POM/Locators/AdminTestCentersLocators.py
Variables   Resources/Variables/Titles.py
Variables   Resources/Variables/Status.py
Resource    POM/Keywords/Modules/base_actions.resource
Resource    POM/Keywords/Pages/dashboard.resource


*** Keywords ***
Open Test Centers Page
    Open Admin Page     page_url=centers

Verify Title Test Center
    Verify Text    ${HEADER}    ${TEST_CENTER}

# Test Centers

Click Btn New Test Center
    Click Button   ${BTN_NEW_TEST_CENTER}

Click Button Search
    Click Button    ${BTN_SEARCH}

Click Button Cancel
    Click Button    ${BTN_NEW_TEST_CENTER}

# TODO: uncomment methods when needed in future tests
#def select_dropdown_name(self, key=Filters.CONTAINS):
#    s(self.DROPDOWN_NAME).all('option').element_by(have.exact_text(key)).click()
#
#def select_dropdown_city(self, key=Filters.CONTAINS):
#    s(self.DROPDOWN_CITY).all('option').element_by(have.exact_text(key)).click()

Fill Filter Name
    [Arguments]     ${text}
    Type Text   selector=${FILTER_FIELD_NAME}    txt=${text}

Fill Filter City
    [Arguments]     ${text}
    Type Text   selector=${FIELD_CITY}    txt=${text}

# TODO: uncomment methods when needed in future tests
#def select_dropdown_statuses(self, key=Status.ACTIVE):
#    s(self.DROPDOWN_CITY).all('option').element_by(have.exact_text(key)).click()
#
#def select_view_of_last_entry(self):
#    s(self.ICON_DOTS).hover()
#    s(self.ICON_VIEW_ACTION).should(be.clickable).click()
#
#def select_edit_of_last_entry(self):
#    s(self.ICON_DOTS).hover()
#    s(self.ICON_EDIT_ACTION).should(be.clickable).click()
#    self.wait_spinners_to_disappear()
#
#def select_remove_of_last_entry(self):
#    s(self.ICON_DOTS).hover()
#    s(self.ICON_REMOVE_ACTION).should(be.clickable).click()

# New Test Center

Verify Title New Test Center
    [Arguments]    ${name}=None
    ${message}=      Set Variable If     'type(${name})'==str     ${name}     ${NEW_TEST_CENTER}
    Wait For Elements State     ${HEADER}  visible
    Verify Text  ${HEADER}   ${message}

Click Button Create Test Center
    Click Button    ${BTN_CREATE_TEST_CENTER}

Select Dropdown County
    [Arguments]    ${text}
    Click Button    ${DROPDOWN_COUNTRY}
    Select Options By   ${DROPDOWN_COUNTRY}     text   ${text}
    Keyboard Key    press   Enter

Select Dropdown Category
    [Arguments]    ${text}
    Click Button    ${DROPDOWN_CATEGORY}
    ${elements}=    Get Elements    ${DROPDOWN_CATEGORY_ITEM}
    FOR    ${el}    IN  @{elements}
        Click   ${el}
    END

Fill Name
    [Arguments]     ${text}
    Type Text   selector=${FIELD_NAME}    txt=${text}

Fill City
    [Arguments]     ${text}
    Type Text   selector=${FIELD_CITY}    txt=${text}
    ${elements}=    Get Elements   selector=.pac-item
    Click   ${elements}[0]

Fill Address
    [Arguments]     ${text}
    Type Text   selector=${FIELD_ADDRESS}    txt=${text}

Fill Phone
    [Arguments]     ${text}
    Type Text   selector=${FIELD_CONTACT_PHONE}    txt=${text}

Select Legislator
    [Arguments]     ${text}
    Select Options By   ${DROPDOWN_LEGISLATOR}  text  ${text}

Fill Test Center Owner Name
    [Arguments]     ${text}
    Type Text   selector=${FIELD_TEST_CENTER_OWNER_NAME}    txt=${text}

Fill Email
    [Arguments]     ${text}
    Type Text   selector=${FIELD_TEST_CENTER_OWNER_EMAIL}    txt=${text}

# View

Verify Message Test Center Creation
    Verify Text  ${TEST_CENTER_CREATION_LOCATOR}   ${TEST_CENTER_CREATION}

Verify Name In Title
    [Arguments]    ${text}
    Verify Text     ${TITLE}  ${text}

Verify Name
    [Arguments]    ${text}
    Verify Text     ${NAME}  ${text}

Verify Adress
    [Arguments]    ${text}
    Verify Text     ${ADDRESS}  ${text}

Verify Category
    [Arguments]    ${text}
    Verify Text     ${SUPPORTED_CATEGORIES}  ${text}

Verify Country
    [Arguments]    ${text}
    Verify Text     ${COUNTRY}  ${text}

Verify City
    [Arguments]    ${text}
    Verify Text     ${CITY}  ${text}

Verify Status
    [Arguments]    ${status}=${ACTIVE}
    Verify Text     ${STATUS}  ${status}

Verify Phone Number
    [Arguments]    ${text}
    Verify Text     ${PHONE_NUMBER}  ${text}

Verify Legislator
    [Arguments]    ${text}='Autotest'
    Verify Text     ${LEGISLATOR}  ${text}

Verify Test Center Owner Name
    [Arguments]    ${text}
    Verify Text     ${TEST_CENTER_OWNER_NAME}  ${text}

Verify Test Center Owner Email
    [Arguments]    ${email}
    Verify Text     ${TEST_CENTER_OWNER_EMAIL}  ${email}
