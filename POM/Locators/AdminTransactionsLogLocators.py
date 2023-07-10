class AdminTransactionsLogLocators:
    TRANSACTIONS_LOG_TEXT = '//*[@id="app"]//h1'
    LAST_ACTION = 'tr:nth-child(1) td[data-label="Actions"]'
    ICON_VIEW = 'tr:nth-child(1) td[data-label="Actions"] li:nth-child(1) a'
    BOX_TITLE_TEXT = '//*[@id="app"]//h2'
    BTN_CANCEL = "//button[text() = 'Cancel']"
    BTN_SEARCH = '//*[text()="Search"]'
    SELECT_STATUS = '//*[@id="status"]'
    FIELD_TRANSACTION_DATE = '//*[@class="input-control"]'
    DETAILS_ITEM = '//*[@class="details-list__item"]'
    LAST_ENTRY = 'tbody tr:nth-child(1)'
