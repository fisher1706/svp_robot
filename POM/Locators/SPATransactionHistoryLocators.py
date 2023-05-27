class SPATransactionHistoryLocators:
    BTN_TRANSACTION_HISTORY = '//*[@href="/history"]'
    ICON_INVOICE = "td[data-label='Invoice'] a"
    FILTER_REFERENCE_NUMBER = 'div[data-label="Reference Number"] input'
    FILTER_AMOUNT = 'div[data-label="Amount"] input'
    FILTER_DATE = 'div[data-label="Date"] input'
    FILTER_STATUS = 'div[data-label="Status"] select'
    REFERENCE_NUMBER_HISTORY = 'td[data-label="Reference Number"]'
    AMOUNT_HISTORY = 'td[data-label="Amount"]'
    DATE_HISTORY = 'td[data-label="Date"]'
    STATUS_HISTORY = 'td[data-label="Status"]'

    FILTERS_HISTORY = [
        FILTER_REFERENCE_NUMBER,
        FILTER_AMOUNT,
        FILTER_DATE,
        FILTER_STATUS
    ]
