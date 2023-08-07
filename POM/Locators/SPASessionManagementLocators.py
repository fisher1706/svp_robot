class SPASessionManagementLocators:
    BTN_SESSION_MANAGEMENT = '//*[@href="/sessions-management"]'
    SESSION_MANAGEMENT_TEXT = '//*[text()="Sessions management"]'
    ENTRY = '//*[@id="app"]//table/tbody/tr'
    FILTER_ICON = '//*[@class="filter-icon"]'
    BTN_APPLY = '//button[text() = "Apply"]'
    BTN_CLEAR_FILTER_MANAGEMENT = '//button[text() = "Clear Filter"]'
    NO_DATA = '//*[@class="modal-box--empty-text"]'
    ACTIONS = 'td[data-label="Actions"]'
    VIEW = 'tr:nth-child(1) a[href="#"]'
    BTN_BACK = '//*[@class="btn back"]'
    BTN_TEST_TACKERS = '//*[@id="app"]//div/a[2]'
    TEST_TACKERS_TEXT = '//*[text()="Test takers"]'
    EMPTY_TEST_TACKERS_DATA = '//*[@class="modal-box--empty-text"]'
    SEARCH_RESULTS = '//*[text()=" Search Results"]'
    FILTER_CONTROL = '//*[@class="filter-controls__tag"]'
    CHOSE_FILTERS = '//*[@class="filter-controls__tag"]'

    SESSION_ID = '//input[@id="session_id"]'
    SEATS_INPUT = '//input[@name="seats"]'
    RESERVATION_INPUT = '//input[@name="reservations"]'
    SESSION_DATE_FROM = '//input[@placeholder="From"]'
    SESSION_DATE_TO = '//input[@placeholder="To"]'

    SEATS_TYPE = ''
    RESERVATION_TYPE = ''
    CATEGORY = ''
    EXAM_SESSION_STATUS = ''
    TYPE = '//*[@class="multiselect__select"]'