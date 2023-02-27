class SPAPaymentLocators:
    BTN_TRANSACTION_HISTORY = '.btn--border-primary'
    BTN_ISSUE = "//button[.='Issue']"
    BTN_GET_CREDIT = "//button[.='Get Credit']"
    BTN_CONFIRM = "//button[.='Confirm']"
    BTN_CANCEL = "//button[.='Cancel']"
    CREDITS_COUNTER = '.green'
    NUMBER_OF_LABORS = '.dark'
    TOTAL_AMOUNT = '.blue'

    FIELD_FILE_ID = 'th:nth-child(1)  .table-main__input'
    PICKER_UPLOAD_DATE = 'th:nth-child(2)  .table-main__input'
    FIELD_NUMBER_OF_PASSED_LABORS = 'th:nth-child(3)  .table-main__input'
    FIELD_TOTAL_LABORS = 'th:nth-child(4)  .table-main__input'
    FIELD_AMOUNT = 'th:nth-child(5)  .table-main__input'
    ACTION_ICON_SELECT = '.toggle-button'
    ENTRY_OF_PAYMENT_TABLE = 'tr:nth-child(1) td'
    BUTTON_PLUS_OF_LAST_ENTRY = 'tr:nth-child(1) td .toggle-button'
    UNSELECT_ALL = '.table-main__mobile-filter-wrap .mb-2'

    # GET CREDIT
    FIELD_CERTIFICATES = '#certificates'
    TOTAL = '.payment-form__total-wrap div'
    BTN_PAY = "//button[.='Pay']"

    # CARD DETAILS
    IFRAME_NUMBER = 'card.number'
    IFRAME_CVV = 'card.cvv'
    FIELD_CARD_NUMBER = "//input[@name='card.number']"
    FIELD_EXPIRY_DATE = '.wpwl-control-expiry'
    FIELD_CVV = "//input[@name='card.cvv']"
    FIELD_CARD_HOLDER = "//input[@name='card.holder']"
    BTN_PAY_NOW = '.custom-pay-btn'
    WARNING_MSG_CARD_NUMBER = '.wpwl-hint-cardNumberError'
    WARNING_MSG_EXPIRY_DATE = '.wpwl-hint-expiryMonthError'
    WARNING_MSG_CVV = '.wpwl-hint-cvvError'
    WARNING_MSG_CARD_HOLDER = '.wpwl-hint-cardHolderError'

    # TRANSACTION STATE
    DROPDOWN_TRANSACTION_STATE = "select[name='returnCode']"
    BTN_TRANSACTION_PAY = 'input[name]'

    # POPUP
    ICON_BIN = '.actions-link'
    ICON_SWITCH = '.switch'

    # PAYMENT CONFIRMATION
    PAYMENT_REFERENCE_NUMBER = ".table-main__table td[data-label='Reference Number']"
    NUMBER_OF_CERTIFICATES = "td[data-label='Number Of Certificates']"
    PRICE_PER_CERTIFICATE = "td[data-label='Price Per Certificate']"
    PAYMENT_TOTAL_AMOUNT = "td[data-label='Total Amount']"
    GRAND_TOTAL = '.files-amount-total__sum'

    # TRANSACTION INFORMATION
    TRANSACTION_REFERENCE_NUMBER = ".table-files td[data-label='Reference Number']"
    AMOUNT = "td[data-label='Amount']"
    DATE = "td[data-label='Date']"
    ICON_INVOICE = "td[data-label='Invoice'] a"

    # CERTIFICATES
    BTN_DOWNLOAD = "//button[.='Download']"
    BTN_SEND_EMAIL = "//button[.='Send Email']"
