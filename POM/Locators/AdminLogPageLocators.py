class AdminLogPageLocators:
    ACTIONS_LOG_TEXT = '//*[@id="app"]//h1'
    LAST_ACTION = 'tr:nth-child(1) td[data-label="Actions"]'
    ICON_VIEW = 'tr:nth-child(1) td[data-label="Actions"] li:nth-child(1) a'
    DETAILS_TEXT = '//*[@id="app"]//h1'
    DETAILS_ITEM = '//*[@class="details-list__item"]'
    BTN_SEARCH = '//*[text()="Search"]'
    BTN_CANCEL = "//button[text() = 'Cancel']"
    SELECT_ENTITY_NAME = '//*[@id="loggable_type"]'
    SELECT_CONTAINS = '//*[@class="form-row"]//select'
    FILTER_FIELD = '//*[@id="loggable_name"]'
    LAST_ENTRY = 'tbody tr:nth-child(1)'
