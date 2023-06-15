class SPAUploadLocators:
    BTN_UPLOADED_FILES = '//*[@href="/upload"]'
    # Individual locators
    BTN_ADD_INDIVIDUAL = '.btn--border-primary'
    FIELD_NATIONAL_ID = '//*[@id="nationalId"]'
    FIELD_LABOR_NAME = '//*[@id="laborName"]'
    FIELD_PASSPORT = '//*[@id="passport"]'
    FIELD_LABOR_EMAIL = '//*[@id="email"]'
    DROPDOWN_EXAM_DATE = 'label[for=examDate] + span input'
    DROPDOWN_TCENTER = '//*[@id="testCenter"]'
    DROPDOWN_OCCUPATION = '#occupation'
    EXAM_RESULT = '//*[@id="score"]'
    ADD_INDIVIDUAL_LABOR = '//*[@class="btn btn-info"]'
    FIELD_FILE_NAME = '.table-files-wrapper td:nth-child(1)'
    # Group Locators
    BTN_ADD_GROUP = '//*[text()="Add Group"]'
    DROPDOWN_TCENTER_LIST = '//*[@id="modals-container"]//div[1]/div/select'
    DROPDOWN_CATEGORY_LIST = '//*[@id="modals-container"]//div[2]/div/select'
    BTN_CHOOSE_FILE = '#upload_file'
    BTN_ADD_FRAME = '.btn-info'
    TD_PASSED_LABORS = '.table tr:nth-child(1) > td:nth-child(3)'
    BTN_CANCEL = '.close-upload-btn'
    FIELD_POPUP_TOTAL_LABORS = 'td[data-label="Total Labors"] span'
    FIELD_FILE_ID = 'th:nth-child(1)  .table-main__input'
    SEARCH_RESULTS = '//*[text()=" Search Results"]'
    PICKER_UPLOAD_DATE = 'th:nth-child(2)  .table-main__input'
    FIELD_NUMBER_OF_PASSED_LABORS = 'th:nth-child(3)  .table-main__input'
    FIELD_NUMBER_OF_LABORS = 'th:nth-child(4)  .table-main__input'
    BTN_DOWNLOAD_CSV_SAMPLE = '.upload-modal .q-page-box__header a'

    FILTERS = [
        FIELD_FILE_ID,
        PICKER_UPLOAD_DATE,
        FIELD_NUMBER_OF_PASSED_LABORS,
        FIELD_NUMBER_OF_LABORS
    ]
