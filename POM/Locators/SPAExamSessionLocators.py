class SPAExamSessionLocators:
    BTN_EXAM_SESSION = '//*[@href="/exam-sessions"]'
    EXAM_SESSION_TEXT = '//*[text()="Exam Sessions"]'
    BTN_ADD_SESSION = '//*[@class="item-add__btn"]'
    TIME_FROM = '//*[text()="From"]'
    TIME_TO = '//*[text()="To"]'
    SEATS = '//*[text()="Choose Number"]'
    CHOOSE_CATEGORY = '//*[@class="multiselect__placeholder"]'
    REPEAT_SESSION = '//*[@class="multiselect__tags"]//*[text()="Does not repeat"]'
    INPUT_TIME_FROM = '//*[@placeholder="From"]'
    INPUT_TIME_TO = '//*[@placeholder="To"]'
    INPUT_SEATS = '//*[@placeholder="Choose Number"]'
    CATEGORY_SESSION = "//span[contains(text(),'Engine Mechanics')]"
    BTN_ADD = '//*[text()="Add"]'
    BTN_OK = '//*[text()="Ok"]'
    SESSION_CATEGORY = '//*[@class="session__category"]'
    SESSION_TIME = '//*[@class="session__time"]'
    SESSION_SEATS = '//*[@class="session__seats"]'
    SESSION_STATUS = '//*[@class="status-label status-label--drafted"]'
    SESSION_SEE_MORE = '//*[@class="session__btn btn"]'
    TEXT_ERROR = '//*[@class="text-error"]'
    SESSION_ENTRY = '//*[@class="details-value"]'
    REPEAT_SESSION_TEXT = '//h1'
    SELECT_REPEAT_EVERY = '//*[@class="input-group input-group--margin-middle repeat-type-select"]' \
                          '//*[@class="multiselect__select"]'
    BTN_PLUS = '//*[@class="number-input__button number-input__button--plus"]'
    BTN_ON = '//*[text()=" On "]/span'
    BTN_AFTER = '//*[text()=" After "]/span'
    FIELD_INPUT_ON = '//*[@class="input-group__input input-group__datepicker"]'
    FIELD_SELECT_AFTER = '//*[@class="input-group input-group--margin-middle repeat-after-select"]' \
                         '//*[@class="multiselect__select"]'
    DEFAULT_SESSION_COUNT = '1 sessions'
    MONTH_SELECT_OPTIONS = '//*[@class="input-group input-group--margin-middle repeat-monthly-select"]' \
                           '//*[@class="multiselect__select"]'
    MONTH_SELECTED = '//*[@class="input-group input-group--margin-middle repeat-monthly-select"]' \
                     '//*[@class="multiselect__option multiselect__option--highlight"]'
    BTN_DONE = "//button[text() = 'Done']"
    REPEAT_ON = '//*[@class="day-checkbox-label"]//*[@class="text"]'
    TYPES_REPEAT_SESSION = '//*[text()="Repeat session"]/../..//*[@class="multiselect__element"]/span/span'
