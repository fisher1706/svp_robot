BTN_NEW_TEST_CENTER = "//a[text() = 'New Test Center']"
BTN_SEARCH = "//button[text() = 'Search']"
DROPDOWN_NAME = "label[for='englishName'] + div select"
FILTER_FIELD_NAME = '#englishName'
DROPDOWN_CITY = "label[for='city'] + div select"
DROPDOWN_STATUSES = '#status'

ICON_DOTS = 'td[data-label="Actions"]'
ICON_VIEW_ACTION = "//ul[@class = 'table-main__actioins-list']//a[text() = 'View']"
ICON_EDIT_ACTION = "//ul[@class = 'table-main__actioins-list']//a[text() = 'Edit']"
ICON_REMOVE_ACTION = "//ul[@class = 'table-main__actioins-list']//a[text() = 'Delete']"

BTN_CREATE_TEST_CENTER = "//button[text() = 'Create Test Center']"
BTN_CANCEL = "//button[text() = 'Cancel']"
FIELD_NAME = '#name'
DROPDOWN_COUNTRY = '#country'
DROPDOWN_CATEGORY = '.arrow'
DROPDOWN_CATEGORY_ITEM = '.multiselect__element span span'
FIELD_CITY = '#city'
FIELD_ADDRESS = '#address'
FIELD_CONTACT_PHONE = '#phoneNumber'
DROPDOWN_LEGISLATOR = '#legislator'
FIELD_TEST_CENTER_OWNER_NAME = '#testCenterOwnerName'
FIELD_TEST_CENTER_OWNER_EMAIL = '#testCenterOwnerEmail'

TITLE = 'h1'
locator = "//span[@class='details-list__title' and text()='{}']//following::div/span"
NAME = locator.format('Name')
ADDRESS = locator.format('Address')
SUPPORTED_CATEGORIES = locator.format('Supported categories')
COUNTRY = locator.format('Country')
CITY = locator.format('City')
STATUS = locator.format('Status')
PHONE_NUMBER = locator.format('Phone Number')
LEGISLATOR = locator.format('Legislator')
TEST_CENTER_OWNER_NAME = locator.format('Test Center Owner Name')
TEST_CENTER_OWNER_EMAIL = locator.format('Test Center Owner Email')