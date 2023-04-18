class SPAPaymentLocators:
    BTN_PAYMENT = '//*[@href="/payment"]'
    BTN_GET_CREDIT = "//button[.='Get Credit']"
    FIELD_CERTIFICATES = '#certificates'
    BTN_PAY = "//button[.='Pay']"

    # CARD DETAILS
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
    PAYMENT_REFERENCE_NUMBER = ".table-main__table td[data-label='Reference Number']"

    SELECT_ALL = '//*[@id="app"]//span/button'
    BTN_ISSUE = "//button[.='Issue']"
    BTN_CONFIRM = "//button[.='Confirm']"
    PAYMENT_AMOUNT = "td[data-label='Amount']"

