class SPATcenterLocators:
    BTN_TCENTER = '//*[@href="/centers"]'
    BTN_ADD_TCENTER = '//*[@class="btn btn--primary"]'
    FIELD_NAME_GENERAL_INFORMATION = '//*[@id="name"]'
    FIELD_OFFICIAL_CONTACT_NUMBER = '//*[@id="phone_number"]'
    FIELD_NAME_TCENTR_OWNER = '//*[@id="owner_full_name"]'
    FIELD_EMAIL = '//*[@id="owner_email"]'
    FIELD_CITY = '//*[@id="city"]'
    FIELD_STREET_NAME = '//*[@id="streetName"]'
    FIELD_POSTAL_CODE = '//*[@id="postal_code"]'
    BTN_ADD_NEW_TCENTR = '//*[@class="btn btn--primary new-test-center__btn"]'
    BTN_ADD_INDIVIDUAL = '.btn--border-primary'
    CATEGORY_LIST = '.checkboxes-list__item'
    ID = '//*[@id="app"]//table/tbody/tr[1]/td[1]'
    NAME = '//*[@id="app"]//table/tbody/tr[1]/td[2]'
    CITY_TC = '//*[@id="app"]//table/tbody/tr[1]/td[3]'
    TCENTER_OWNER = '//*[@id="app"]//table/tbody/tr[1]/td[4]'
    STATUS = '//*[@id="app"]//table/tbody/tr[1]/td[5]'
    ACTIONS = 'td[data-label="Actions"]'
    FIELD_COUNTRY = '#country'
    ICON_VIEW_ACTION = 'tr:nth-child(1) a[href="view"]'
    ICON_EDIT_ACTION = 'tr:nth-child(1) a[href="edit"]'
    ICON_REMOVE_ACTION = 'tr:nth-child(1) a[href="delete"]'
    FILTER_ID = 'div[data-label="ID"] input'
    FILTER_NAME = 'div[data-label="Name"] input'
    FILTER_CITY = 'div[data-label="City"] input'
    FILTER_TCENTER_OWNER = 'div[data-label="Test Center Owner"] input'
    FILTER_STATUS = 'div[data-label="Status"] select'
    WARNING_NAME = '//input[@id="name"]/parent::div/following-sibling::div/span/span'
    WARNING_PHONE_NUMBER = '//input[@id="phone_number"]/parent::div/following-sibling::span'
    WARNING_CATEGORY = '.checkboxes-list + span'
    WARNING_OWNER_NAME = '//input[@id="owner_full_name"]/parent::div/following-sibling::div/span/span'
    WARNING_EMAIL = '//input[@id="owner_email"]/parent::div/following-sibling::div/span/span'
    WARNING_CITY = '#city + span'
    WARNING_STREET = '//input[@id="streetName"]/parent::div/following-sibling::div/span/span'
    WARNING_POSTAL_CODE = '//input[@id="postal_code"]/parent::div/following-sibling::div/span/span'
    SEARCH_RESULTS = '//*[text()=" Search Results"]'
    TEST_CENTER_INFORMATION = '//*[text()="Test Center Information"]'
    BTN_ADD = '//button[.="Add"]'
    BTN_EDIT = '//button[.="Edit"]'
    BTN_CONFIRM = '//button[.="Confirm"]'

    FILTERS = [
        FILTER_ID,
        FILTER_NAME,
        FILTER_CITY,
        FILTER_TCENTER_OWNER,
        FILTER_STATUS
    ]
