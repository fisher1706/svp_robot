class AdminCertificateBalanceLocators:
    CERTIFICATE_BALANCE_TEXT = '//*[@id="app"]//h1'
    BTN_CANCEL = "//button[text() = 'Cancel']"
    SELECT_OWNER_ROLE = '//*[@id="status"]'
    # SELECT_COUNTRY = '//*[@id="country"]'
    SELECT_COUNTRY = "select[id='country']"
    # SELECT_COUNTRY = "#country"
    FIELD_OWNER_NAME = '//*[@id="id"]'
    BTN_SEARCH = '//*[text()="Search"]'
    LAST_ENTRY = 'tbody tr:nth-child(1)'
