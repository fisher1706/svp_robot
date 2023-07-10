class AdminCsvHistoryPageLocators:
    CSV_HISTORY_TEXT = '//*[@id="app"]//h1'
    LAST_ACTION = 'tr:nth-child(1) td[data-label="actionIcon"]'
    ICON_EYE = 'tr:nth-child(1) td[data-label="actionIcon"] li:nth-child(1) a'
    DETAILS_CSV_TEXT = '//*[@id="app"]//h2'
    DETAILS_ITEM = '//*[@class="details-list__item"]'
    LAST_ENTRY = 'tbody tr:nth-child(1)'
    BTN_CANCEL = "//button[text() = 'Cancel']"
