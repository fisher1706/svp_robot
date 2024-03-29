class AdminOccupationLocators:
    OCCUPATIONS_TEXT = '//*[@id="app"]//h1'
    BTN_NEW_OCCUPATION = '//*[@href="/occupations/add"]'
    BTN_UPLOAD_FILE = '//*[text()="Upload File"]'
    BTN_FILTERS = '//*[@class="filter-icon"]'
    BTN_APPLY = '//*[text()="Apply"]'
    BTN_CLEAR = '//*[text()="Clear"]'
    NEW_OCCUPATION_TEXT = '//*[text()="New Occupation"]'
    FIELD_KEY = '//*[@id="occupation_key"]'
    FIELD_ARABIC_NAME = '//*[@id="arabic_name"]'
    FIELD_ENGLISH_NAME = '//*[@id="name"]'
    FIELD_CATEGORY = '//*[@id="category"]'
    BTN_ADD = '//*[text()="Add"]'
    DOWNLOAD_AND_UPLOAD_FILE_TEXT = '//*[text()="Download & Upload File"]'
    DOWNLOAD_OCCUPATIONS_CSV = '//*[text()=" download occupations csv "]'
    BTN_CHOOSE_FILE = '#upload_file'
    FIELD_SAVED_COUNT = 'td[data-label="Saved count"]'
    FIELD_SKIPPED_COUNT = 'td[data-label="Skipped count"]'
    FIELD_TOTAL_COUNT = 'td[data-label="Total count"]'
    BTN_DONE = '//*[text()="Done"]'
    KEY_ERROR = '//*[text()="has already been taken"]'
    FIELD_ADD_SUCCESS = '//*[@class="toasted-container alert-msg top-center"]'
