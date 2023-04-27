class SPAPaymentLocators:
    BTN_PAYMENT = '//*[@href="/payment"]'
    BTN_GET_CREDIT = "//button[.='Get Credit']"
    FIELD_CERTIFICATES = '#certificates'
    BTN_PAY = "//button[.='Pay']"
    IFRAME_NUMBER = 'card.number'
    IFRAME_CVV = 'card.cvv'
    FIELD_CARD_NUMBER = 'css=iframe[name="card\\.number"] >>> input[name=\'card.number\']'
    FIELD_EXPIRY_DATE = '.wpwl-control-expiry'
    FIELD_CVV = 'iframe[name="card\\.cvv"] >>> input[name=\'card.cvv\']'
    FIELD_CARD_HOLDER = "//input[@name='card.holder']"
    BTN_PAY_NOW = '.custom-pay-btn'
    WARNING_MSG_CARD_NUMBER = '.wpwl-hint-cardNumberError'
    WARNING_MSG_EXPIRY_DATE = '.wpwl-hint-expiryMonthError'
    WARNING_MSG_CVV = '.wpwl-hint-cvvError'
    WARNING_MSG_CARD_HOLDER = '.wpwl-hint-cardHolderError'
    BTN_TRANSACTION_PAY = 'input[name]'
    SELECT_ALL = '//*[@id="app"]//span/button'
    BTN_ISSUE = "//button[.='Issue']"
    BTN_CONFIRM = "//button[.='Confirm']"
    PAYMENT_AMOUNT = "td[data-label='Amount']"
    DROPDOWN_TRANSACTION_STATE = "select[name='returnCode']"
    TOTAL = '.payment-form__total-wrap div'
    CREDITS_COUNTER = '.green'
    NUMBER_OF_LABORS = '.dark'
    TOTAL_AMOUNT = '.blue'
    TOTAL_LABORS = '//*[@id="app"]//tbody/tr/td[4]'
    AMOUNT_ENTRY = '//*[@id="app"]//tbody/tr/td[5]'
    CERTIFICATES = '//*[@class="certificates-block__text"]'
    GRAND_TOTAL = '.files-amount-total__sum'
    FILE_NAME = "td[data-label='File Name']"
    NUMBER_OF_PASSED_LABORS = "td[data-label='Number of Passed Labors']"
    PRICE_PER_LABOR = "td[data-label='Price Per Labor']"
    TOTAL_AMOUNT_PAYMENT = "td[data-label='Total Amount']"
    REFERENCE_NUMBER = ".table-main__table td[data-label='Reference Number']"
    AMOUNT_TRANS = "td[data-label='Amount']"
    DATE = "td[data-label='Date']"
    BTN_DOWNLOAD = "//button[.='Download']"
