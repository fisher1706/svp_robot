class AdminLaborsLocators:
    BTN_USERS = '//*[text()="Users"]'
    LABORS = '//*[@href="/registered-labors"]'
    LABORS_TEXT = '//*[@id="app"]//h1'
    ACTIVE_LABORS = '//*[text()="Active"]/../..'
    NATIONAL_ID = '//*[@class="national_id"]'
    GENERAL_INFORMATION = '//*[text()="General Information"]'
    DATA_GENERAL_INFORMATION = '//*[@class="info-value"]'
    BTN_YES = '//*[text()="yes"]'
    REVOKED_LABORS = '//*[text()="Revoked"]/../..'
    BTN_BACK = '//*[text()=" Back "]'
    BTN_CERTIFICATES = '//*[@class="certificates-item"]'
    CERTIFICATES_SERIAL_NUMBER = '//*[text()="Certificate Serial Number"]'

    BTN_FILTERS = '//*[@class="filter-icon"]'
    BTN_APPLY = '//*[text()="Apply"]'
    BTN_CLEAR = '//*[text()="Clear"]'

    FIELD_NATIONAL_ID = '//*[@id="nationalId"]'
    FIELD_FULL_NAME = '//*[@id="fullName"]'
    FIELD_PASSPORT_NUMBER = '//*[@id="passportNumber"]'
    FIELD_PHONE_NUMBER = '//*[@id="phoneNumber"]'

    FIELD_COUNTRY_OF_RESIDENCE = "//*[contains(text(),'Select Country')]"
    INPUT_COUNTRY_OF_RESIDENCE = '//*[@id="countriesSelect"]'
    FIELD_NATIONALITY = "//*[contains(text(),'Choose nationality')]"
    INPUT_NATIONALITY = '//*[@id="nationalitiesSelect"]'
    FIELD_STATUS = "//*[contains(text(),'Select status')]"
    INPUT_STATUS = '//*[@id="app"]//div[1]/div[7]//ul/li[1]'

    FIELD_LAST_ACTIVE_DATE = '//*[@placeholder="dd-mm-yyyy"]'
    FIELD_EMAIL = '//*[@id="email"]'

    FILTERS_CONTROL = '//*[@class="filter-controls__tag"]'
