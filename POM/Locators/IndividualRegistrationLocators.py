class IndividualRegistrationLocators:
    FIELD_FIRST_NAME = '//*[@id="firstName"]'
    FIELD_LAST_NAME = '//*[@id="lastName"]'
    FIELD_NATIONAL_ID = '//*[@id="nationalId"]'
    FIELD_PASSPORT_NUMBER = '//*[@id="passportNumber"]'
    SELECT_COUNTRY_OF_RESIDENCE = '//*[text() = "Country of residence"]/../..//*[@class="multiselect__select"]'
    SELECT_NATIONALITY = '//*[text() = "Nationality"]/../..//*[@class="multiselect__select"]'
    FIELD_EMAIL = '//*[@id="email"]'
    FIELD_DATE_OF_BIRTH = '//*[@placeholder="Enter your birth date"]'
    FIELD_PASSPORT_EXPIRATION = '//*[@placeholder="Enter passport expiration"]'
    FIELD_PASSWORD = '//*[@id="password"]'
    FIELD_CONFIRM_PASSWORD = '//*[@id="confirmPassword"]'
    CHECKBOX_ACKNOWLEDGE = 'label[for="confirm"]'
    BTN_CONTINUE = '//button[text() = "Continue"]'
