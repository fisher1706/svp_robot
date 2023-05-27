class SPALaborLocators:
    BTN_LABORS = '//*[@href="/labors-list"]'
    EDIT_EMAIL_FIELD = 'td[data-label="Email"]'
    FIELD_POPUP_EMAIL = '//*[@id="email"]'
    EMAIL_FIELD = '//*[@id="modals-container"]//span/span'
    ERROR_EMAIL_FIELD = '//*[@id="modals-container"]//span/span'
    BTN_SAVE_EMAIL = '//*[@id="modals-container"]//button[1]'
    VALUE_SEARCH_RESULT = '.pagination-wrap__text'
    LAST_ENTRY = 'tr:nth-child(1) td'
    NATIONAL_ID = 'th:nth-child(1)  .table-main__input'
    LABOR_NAME = 'th:nth-child(2)  .table-main__input'
    PASSPORT_NUMBER = 'th:nth-child(3)  .table-main__input'
    EMAIL = 'th:nth-child(4)  .table-main__input'
    CATEGORY_LABOR = '//*[@id="app"]//th[5]//span//select'
    TEST_CENTERS = '//*[@id="app"]//th[6]//span//select'
    EXAM_DATE = 'th:nth-child(7)  .table-main__input'
    EXAM_RESULT_LABOR = '//*[@id="app"]//th[8]//span//select'
    LABOR_TEXT = '//*[@id="app"]//h2'
    COUNT = '//*[@id="app"]//div[3]//li[2]'
    ALL = '.green'

    FILTERS_LABOR = [
        NATIONAL_ID,
        LABOR_NAME,
        PASSPORT_NUMBER,
        EMAIL,
        CATEGORY_LABOR,
        TEST_CENTERS,
        EXAM_DATE,
        EXAM_RESULT_LABOR
    ]
