class SPAStartExamLocators:
    SVPI_RESERVATIONS_TEXT = '//*[@id="app"]//h1'
    LAST_ENTRY = 'tbody tr:nth-child(1)'
    FILTER_FIELD_NAME = '//*[@id="englishName"]'
    FILTER_FIELD_CITY = '//*[@id="city"]'
    HEADER_SECTIONS_TEXT = '//*[@class="header-section"]'
    FIELD_EMAIL = '//*[text()="Test Center Owner Email"]/..//*[@class="details-list__value"]'
    BTN_START_EXAM = '//*[@href="/start-exam"]'
    RESERVATION_INFO_TEXT = '//*[@id="app"]//h1'
    FIELD_PASSPORT_NUMBER = '//*[@id="passport_number"]'
    FIELD_RESERVATION_NUMBER = '//*[@id="reservation-number"]'
    BTN_CHECK = '//button[text() = "Check"]'
    BTN_NEXT_EXAM = '//button[text() = "Next"]'
    ENTRY_INFO = '//*[@class="col-md-4"]'
    TERMS_AND_CONDITIONS_TEXT = '//*[@id="app"]//h2'
    ENTRY_TERMS_AND_CONDITIONS = '//ol//li'
    AGREEMENT = '//*[@class="checkbox__label"]'
    BTN_START_EXAM_TERMS = '//button[text() = "Start exam"]'
    RESERVATION_ERROR = '//*[@class="row"]/div/span'
