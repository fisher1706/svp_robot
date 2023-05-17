class SPATransactionHistoryLocators:
    BTN_TRANSACTION_HISTORY = '//*[@href="/history"]'
    ICON_INVOICE = "td[data-label='Invoice'] a"

    FILTER_REFERENCE_NUMBER = 'div[data-label="Reference Number"] input'
    FILTER_AMOUNT = 'div[data-label="Amount"] input'
    FILTER_DATE = 'div[data-label="Date"] input'
    FILTER_STATUS = 'div[data-label="Status"] select'

    REFERENCE_NUMBER_HISTORY = '//*[@id="app"]//table/tbody/tr[1]/td[1]'
    AMOUNT_HISTORY = '//*[@id="app"]//table/tbody/tr[1]/td[2]'
    DATE_HISTORY = '//*[@id="app"]//table/tbody/tr[1]/td[3]'
    STATUS_HISTORY = '//*[@id="app"]//table/tbody/tr[1]/td[4]'

    FILTERS_HISTORY = [
        FILTER_REFERENCE_NUMBER,
        FILTER_AMOUNT,
        FILTER_DATE,
        FILTER_STATUS
    ]
