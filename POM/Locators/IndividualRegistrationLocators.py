class IndividualRegistrationLocators:
    FIELD_FIRST_NAME = '//*[@id="firstName"]'
    FIELD_LAST_NAME = '//*[@id="lastName"]'
    FIELD_NATIONAL_ID = '//*[@id="nationalId"]'
    FIELD_PASSPORT_NUMBER = '//*[@id="passportNumber"]'
    SELECT_COUNTRY_OF_RESIDENCE = '//*[text() = "Country of residence"]/../..//*[@class="multiselect__select"]'
    OPEN_COUNTRIES = '//*[text() = "Country of residence"]/../..//*[@class="multiselect__element"]/span/span'
    SELECT_NATIONALITY = '//*[text() = "Nationality"]/../..//*[@class="multiselect__select"]'
    OPEN_NATIONALITY = '//*[text() = "Nationality"]/../..//*[@class="multiselect__select"]/..' \
                       '//*[@class="multiselect__element"]/span/span'
    FIELD_EMAIL = '//*[@id="email"]'
    FIELD_DATE_OF_BIRTH = '//*[@placeholder="Enter your birth date"]'
    FIELD_PASSPORT_EXPIRATION = '//*[@placeholder="Enter passport expiration"]'
    FIELD_PASSWORD = '//*[@id="password"]'
    FIELD_CONFIRM_PASSWORD = '//*[@id="confirmPassword"]'
    CHECKBOX_ACKNOWLEDGE = 'label[for="confirm"]'
    BTN_CONTINUE = '//*[@id="continue_button2"]'
    PASSPORT_NUMBER_TEXT = '//*[@class="modal-form__sub-heading"]'
    BTN_CONFIRM_AND_PROCEED = '//button[text() = "Confirm and proceed"]'
    REGISTER_INTO_SVP_TEXT = '//*[@id="app"]//h1'
    TWO_FA_FIELD = '//*[@class="confirmation-item"]//*[@id="fk_1"]'
    BTN_CONTINUE_EMAIL = '//*[@class="code-confirmation email-confirmation"]//*[@id="continue_button"]'
    BTN_ERROR_OK = '//button[text() = "Ok"]'
    FIELD_ERROR_MSG_NATIONAL_ID = '//*[text() = "National ID"]/../..' \
                                  '//*[@class="validation-message__text validation-message__text--error"]'
    FIELD_ERROR_MSG_EMAIL = '//*[text() = "Email"]/../..' \
                            '//*[@class="validation-message__text validation-message__text--error"]'
    FIELD_ERROR_MSG_PASSPORT_NUMBER = '//*[text() = "Passport number"]/../..' \
                                      '//*[@class="validation-message__text validation-message__text--error"]'
    FIELD_ERROR_MSG_FIRST_NAME = '//*[text() = "First name"]/../..' \
                                 '//*[@class="validation-message__text validation-message__text--error"]'
    FIELD_ERROR_MSG_LAST_NAME = '//*[text() = "Last name"]/../..' \
                                '//*[@class="validation-message__text validation-message__text--error"]'
    BTN_BACK = '//button[text() = "Back "]'
    INTERRUPT_FIELD_MSG = '//*[@class="description"]'
