class AdminInvoiceHistoryPageLocators:
    INVOICE_HISTORY_TEXT = '//*[@id="app"]//h1'
    REFERENCE_NUMBER_TEXT = '//*[text()="Reference Number"]'
    LAST_ACTION = 'tr:nth-child(1) td[data-label="Actions"]'
    ICON_EYE = 'tr:nth-child(1) td[data-label="Actions"] li:nth-child(1) a'
    DETAILS_LIST = '//*[@class="details-list__value"]'
