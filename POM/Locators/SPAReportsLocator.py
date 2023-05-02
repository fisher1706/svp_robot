class SPAReportsLocator:
    BTN_REPORTS = '//*[@href="/reports"]'
    ACTIONS = '//*[@class="actions-link"]'
    ICON_REPORT = "td[data-label='Report'] a"
    BTN_DOWNLOAD = "//button[.='Download']"
    FILTER_FIELD_ID = 'th:nth-child(1)  .table-main__input'
    FILTER_FIELD_GROUP_NO = 'th:nth-child(2)  .table-main__input'
    FILTER_FIELD_AMOUNT = 'th:nth-child(3)  .table-main__input'
    FILTER_FIELD_DATE = 'th:nth-child(4)  .table-main__input'
    FIELD_ID = '//*[@id="app"]//table/tbody/tr/td[1]'
    FIELD_GROUP_NO = '//*[@id="app"]//table/tbody/tr/td[2]'
    FIELD_AMOUNT = '//*[@id="app"]//table/tbody/tr/td[3]'
    FIELD_DATE = "td[data-label='Date'] span"
    FIELD_STATUS = "td[data-label='Status'] span"
    BTN_CLEAR_FILTER = '.link'
    BTN_CHECK_VALIDITY = '.check-validity-link'
    FIELD_PASSPORT_NUMBER = '#passport'
    FIELD_CERTIFICATE_SERIAL_NUMBER = '#certificate'
    BTN_VERIFY = '.btn--border-primary'
    MSG_VALID_CERTIFICATE = '.results__message'
    RESULT_PASSPORT_NUMBER = '.results__heading + div div:nth-child(2) div'
    RESULT_CERTIFICATE_SERIAL_NUMBER = '.results__heading + div div:nth-child(3) div'
    LABOR_NAME = "//div[.='Labor Name']/following-sibling::div"
    PASSPORT_NUMBER = "//div[@class='results']//div[.='Passport Number']/following-sibling::div"
    ICON_CERTIFICATES = "td[data-label='Certificates'] a"

    FILTERS = [
        FILTER_FIELD_ID,
        FILTER_FIELD_GROUP_NO,
        FILTER_FIELD_AMOUNT,
        FILTER_FIELD_DATE
    ]