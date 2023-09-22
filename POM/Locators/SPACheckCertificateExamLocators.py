class SPACheckCertificateExamLocators:
    BTN_CHECK_CERTIFICATE_AND_EXAM_RESULT = '//button[text() = "Check certificate & exam result"]'
    BTN_VERIFY = '//button[text() = "Verify "]'
    POINT_CHECK_CERTIFICATE_VALIDITY = '//*[text() = " Check certificate validity "]'
    POINT_CHECK_LABOR_RESULT = '//*[text() = " Check labor result "]'
    FIELD_PASSPORT_NUMBER = '//*[@id="passportNumber"]'
    FIELD_CERTIFICATE_NUMBER = '//*[@id="serialNumber"]'
    FIELD_NATIONALITY_CODE = '//*[@id="nationalityCode"]'
    FIELD_OCCUPATION_KEY = '//*[@id="occupationKey"]'
    HIDE_ICON = '//*[@class="hide-icon"]'
    FIELD_MSG_INVALID_PASSPORT = '//*[text() = "Passport number"]/../..' \
                                 '//*[@class="validation-message__text validation-message__text--error"]'
    FIELD_MSG_INVALID_CERTIFICATE = '//*[text() = "Certificate number"]' \
                                    '/../..//*[@class="validation-message__text validation-message__text--error"]'
    FIELD_CERTIFICATE_SUCCESS_MESSAGE = '//*[@class="toasted alert-msg-inner toasted-primary success"]'
    FIELD_CERTIFICATE_ERROR_MESSAGE = '//*[@class="toasted alert-msg-inner toasted-primary error"]'
    FIELD_MSG_INVALID_OCCUPATION_KEY = '//*[text() = "Occupation Key"]/../..//*' \
                                       '[@class="validation-message__text validation-message__text--error"]'
    FIELD_MSG_INVALID_NATIONALITY_CODE = '//*[text() = "Nationality code"]/../..//*' \
                                         '[@class="validation-message__text validation-message__text--error"]'
    FIELD_LABOR_RESULT_MESSAGE = '//*[@class="col-12 info-item info-item__no-data"]'
